# Senior Code Review — Furniture App (SwiftUI)

**Reviewer focus (per your request):** Architecture & structure, Code quality
**Scope:** 73 Swift files, ~5,400 LOC. SwiftUI + Firebase (Auth, Firestore, Messaging), Kingfisher.
**Overall:** Solid, working app with a clean visual layer and a real backend. The foundations are good — `NavigationStack` routing, `ObservableObject` view models, a service layer for Firestore. The main issues are *consistency* and *cleanliness*: the codebase shows its history (multiple half-finished refactors living side by side), which makes it harder to extend and onboard onto. None of this is catastrophic; it's the difference between "works" and "maintainable."

Findings are prioritized **P1 (fix soon) → P3 (polish)**. Items marked ✅ were already applied in this pass.

---

## What was already fixed in this pass (low-risk)

- ✅ **FCM message-ID key bug.** `gcmMessageIDKey = "gcm.Message_ID "` had a trailing space and wrong casing, so `userInfo[gcmMessageIDKey]` would never match. Corrected to `"gcm.message_id"`.
- ✅ **Removed dead/commented code** in `Products.swift` (two large commented-out arrays + an old model), `Order.swift` (commented alternate struct), and `CartManager.swift` (the entire class was commented out — file is now a stub flagged for deletion from the target).
- ✅ **Replaced `.gitignore`** with a proper Swift/Xcode template and flagged `GoogleService-Info.plist` (currently committed) for untracking.

---

## P1 — Architecture & structure

### 1. The `New/` folder signals an unfinished migration
`Sources/Screens/New/` holds your current, better implementations (`ProductService`, `ProductViewModel`, `CategoryService`, `OrderService`, `OrderManager`, `FinalCartManager`, `CartItem`, `Order`). Meanwhile the old equivalents linger elsewhere (`Supporting FIles/Utilities/CartManager.swift`). "New" and "Final" are temporary names that become permanent. Recommend:

- Delete the superseded `CartManager.swift` from the Xcode target.
- Rename `FinalCartManager` → `CartStore` (or `CartManager` once the old one is gone).
- Dissolve `New/` and move each type into a feature-aligned folder: `Services/`, `Models/`, `Stores/` (or co-locate with their feature). A reader should never have to guess which of two similarly-named types is the live one.

### 2. No dependency injection — services are hard-wired into view models
```swift
final class ProductViewModel: ObservableObject {
    private let service = ProductService()   // concrete, non-injectable
}
```
Every VM news-up its own concrete service. That makes the app **untestable** (you can't substitute a fake Firestore) and couples the UI layer directly to Firebase. Introduce a protocol and inject it:
```swift
protocol ProductFetching {
    func fetchProducts() async throws -> [Products]
}

final class ProductViewModel: ObservableObject {
    private let service: ProductFetching
    init(service: ProductFetching = ProductService()) { self.service = service }
}
```
This is the single highest-leverage change for long-term maintainability and is the precondition for any unit testing.

### 3. Navigation is split between two systems
You have a well-designed centralized router (`AppNavigationManager` + `AppRoute` enums + `navigationDestination`), **but** several screens bypass it with inline `NavigationLink { DestinationView() }` (e.g. `HomeTabView` → `SearchBarActionView`, `ProductDetailView`, `MostCategoryView`). Pick one model. Since you've invested in the typed router, route everything through it so deep-linking, back-stack control, and `popToRoot` behave consistently. Mixing the two is the kind of thing that causes "the back button does the wrong thing" bugs later.

Also: `favouriteTabDestination(.favourites)` currently returns `ProfileView()` — looks like a copy/paste wire-up bug.

### 4. No `@MainActor` on view models; manual `DispatchQueue.main.async` everywhere
Every VM hops to the main queue by hand inside completion handlers. Annotate the VMs (or their `@Published` mutations) with `@MainActor` and the compiler enforces main-thread updates for you, removing the boilerplate and a whole class of "Publishing changes from background threads" warnings:
```swift
@MainActor
final class ProductViewModel: ObservableObject { ... }
```
(Concurrency wasn't a selected focus area, so I'm flagging rather than detailing — happy to do a full async/await pass on the service layer if you want it.)

---

## P2 — Code quality

### 5. 62 `print()` statements as the logging strategy
`print` is invisible in production, unstructured, and can leak data (you currently print **FCM tokens** and full notification `userInfo` payloads). Replace with `os.Logger`, gated to debug where appropriate:
```swift
import OSLog
private let log = Logger(subsystem: "com.owais.furniture", category: "Push")
log.debug("FCM token received")   // never log the token value itself
```

### 6. Errors are swallowed
The service layer leans on `try?` + `print(error)`:
```swift
let products = snapshot?.documents.compactMap { try? $0.data(as: Products.self) } ?? []
```
Two problems: a single malformed document silently vanishes from the list (`try?` drops it), and failures never reach the UI. Decode with explicit handling, and surface a user-visible error state (`@Published var errorMessage`) so the screen can show a retry instead of an empty list that looks "done."

### 7. Seed/dev code lives in production view files
`HomeTabView.swift` ends with a free function `uploadProducts()` that writes the hardcoded `productsDataArray` into Firestore. This is one-time seeding code sitting in a SwiftUI view file, shipped in the app binary. Move it to a `#if DEBUG` dev-tools file (or a separate command-line target / script) and keep it out of release builds.

### 8. Naming and model hygiene
- **`Products`** (the single-item model) should be singular **`Product`**; the collection is the plural. This reads backwards everywhere (`ForEach(productVM.products) { product in }` where `product` is a `Products`).
- **`maxStars: 5`** is a computed constant baked into the model — fine, but it's view configuration, not product data. Move to the rating view.
- **Magic numbers**: `shippingCharge = 10`, `deliveryFees = 50`, `.retry(maxCount: 3)`, `maxFCMTokenAttempts = 5`. Pull pricing constants into a `Pricing` namespace or remote config — hardcoded shipping/fees in an e-commerce app will bite you.
- **`FinalCartManager` has both `totalPayment` (uses `shippingCharge`) and `grandTotalPayment` (uses `deliveryFees`)** — two near-identical totals with unclear semantics. Consolidate into one well-named computed total and document what each fee means.

### 9. Typos baked into filenames and identifiers
`Supporting FIles` (capital I), `LoadserverImageView`, `DiscountcardView`. Renaming files is slightly more involved in Xcode (project + references), but these are the names you and any collaborator will read for the project's lifetime. Worth a cleanup commit: `Supporting Files`, `ServerImageView`, `DiscountCardView`.

### 10. `AppDelegate` is doing too much
The FCM token-retrieval logic (recursive `attemptFCMTokenRetrieval`, exponential backoff, delete-and-regenerate, attempt counters) is ~80 lines of stateful retry code inside `AppDelegate`. Firebase already retries token acquisition internally; this hand-rolled loop adds complexity and risk for little benefit. Extract a small `PushNotificationService` and lean on the `MessagingDelegate` callback (`didReceiveRegistrationToken`) as the single source of truth, which you already implement.

---

## P3 — Polish & consistency

- **Fonts:** `Font.custom("Switzer-Regular", size: 13)` is repeated dozens of times across views. Add a small `Font` extension (`.switzer(.regular, 13)`) or design-token style helpers so a font change is one edit, not a hundred.
- **Colors:** mix of `Color("AppColor")` (string-keyed, unchecked) and `.textClr` (asset symbol). Standardize on the type-safe asset-catalog accessors everywhere.
- **`UserProfile`** is a plain struct decoded by hand field-by-field in `LoginViewModel`. Make it `Codable` and decode with `document.data(as:)` like your other models for consistency.
- **`ProfileViewModel` is empty** — either implement or remove.
- **Previews** pass `.environmentObject` manually per-view; consider a small `PreviewContainer` helper to DRY this up.
- **`RoundedCorner`, `EnableSwipeBackGesture`, `UIViewRepresentable.swift`** — confirm the generic filename `UIViewRepresentable.swift` doesn't shadow expectations; name files after the type they contain.

---

## Security note (outside requested focus, but worth one line)
`GoogleService-Info.plist` is committed to git. It isn't a private key, but combined with permissive Firestore rules it's a common leak vector. The bigger question is your **Firestore security rules** — make sure `products`/`categories` are read-only to clients and `users/{uid}/orders` is locked to `request.auth.uid == uid`. Client code like `OrderService` assumes this but can't enforce it.

---

## Suggested order of attack
1. Delete dead `CartManager.swift` from the target; rename `New/` types and dissolve the folder. *(structure clarity, low risk)*
2. Introduce service protocols + DI on the 4 view models. *(unlocks testing)*
3. Route all navigation through `AppNavigationManager`; fix the `favourites → ProfileView` mis-wire.
4. Add `@MainActor` to VMs and replace `print` with `Logger`.
5. Naming pass: `Product`, fix filename typos, extract font/pricing constants.
6. Add the first unit tests against the now-injectable services.

Items 1, 4 (the `print`→`Logger` half), and 5's constants are mechanical and safe; 2 and 3 are the ones that genuinely improve the architecture.
