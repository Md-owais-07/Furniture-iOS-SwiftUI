//
//  AppNavigationManager.swift
//  Furniture App
//
//  Created by Owais on 4/24/25.
//

import Foundation
import SwiftUI

class AppNavigationManager: ObservableObject {
    @Published var path: [AppRoute] = []
    @Published var selectedTab: CustomTabBarView.Tab = .home
    
    func push(_ route: AppRoute) {
        path.append(route)
    }
    
    func pop() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    func popToRoot() {
        path.removeAll()
    }
    
    func popToRootWithTab(_ tab: CustomTabBarView.Tab) {
        path.removeAll()
        selectedTab = tab
    }
}


enum AppRoute: Hashable {
    case auth(AuthRoute)
    case tabbar(TabbarRoute)
    case homeTab(HomeTab)
    case favouriteTab(FavouriteTab)
    case shoppingTab(ShoppingTab)
    case profileTab(ProfileTab)
}

enum AuthRoute: Hashable {
    case login
    case signUp
}

enum TabbarRoute: Hashable {
    case tabbar
}

enum HomeTab: Hashable {
    case notifications
}

enum FavouriteTab: Hashable {
    case favourites
}

enum ShoppingTab: Hashable {
    case checkout
    case payment
    case verifyOtp
    case paymentSuccess
}

enum ProfileTab: Hashable {
    case profile
    case paymentMethod
    case orderHistory
    case deliveryAddress
    case support
    case policy
}

@ViewBuilder
func authDestination(_ route: AuthRoute) -> some View {
    switch route {
    case .login:
        LoginView()
    case .signUp:
        RegisterView()
    }
}

@ViewBuilder
func tabbarDestination(_ route: TabbarRoute) -> some View {
    switch route {
    case .tabbar:
        CustomTabBarView()
    }
}

@ViewBuilder
func homeTabDestination(_ route: HomeTab) -> some View {
    switch route {
    case .notifications:
        NotificationView()
    }
}

@ViewBuilder
func favouriteTabDestination(_ route: FavouriteTab) -> some View {
    switch route {
    case .favourites:
        ProfileView()
    }
}

@ViewBuilder
func shoppingTabDestination(_ route: ShoppingTab) -> some View {
    switch route {
    case .checkout:
        CheckoutView()
    case .payment:
        PaymentView()
    case .verifyOtp:
        VerifyOtpView()
    case .paymentSuccess:
        PaymentSuccessView()
    }
}

@ViewBuilder
func profileTabDestination(_ route: ProfileTab) -> some View {
    switch route {
    case .profile:
        ProfileView()
    case .paymentMethod:
        PaymentMethodView()
    case .orderHistory:
        OrderHistoryView()
    case .deliveryAddress:
        DeliveryAddressView()
    case .support:
        SupportView()
    case .policy:
        PolicyView()
    }
}
