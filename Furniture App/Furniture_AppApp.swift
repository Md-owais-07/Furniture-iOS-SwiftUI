//
//  Furniture_AppApp.swift
//  Furniture App
//
//  Created by Owais on 1/25/25.
//

import SwiftUI
import FirebaseCore
import FirebaseMessaging

class AppDelegate: UIResponder, UIApplicationDelegate {
    let gcmMessageIDKey = "gcm.Message_ID "
    private var pendingFCMTokenRequest = false
    private var fcmTokenRetrievalAttempts = 0
    private let maxFCMTokenAttempts = 5
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        
        // Set messaging delegate first
        Messaging.messaging().delegate = self
        print("Firebase Messaging Delegate Set: \(Messaging.messaging().delegate != nil)")
        
        //MARK: Register for remote notifications
        UNUserNotificationCenter.current().delegate = self

        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(
          options: authOptions,
          completionHandler: { granted, error in
              if let error = error {
                  print("❌ Notification authorization error: \(error.localizedDescription)")
              } else {
                  print("✅ Notification authorization granted: \(granted)")
                  if granted {
                      DispatchQueue.main.async {
                          application.registerForRemoteNotifications()
                      }
                  } else {
                      // Even if authorization is denied, try to get FCM token for silent notifications
                      self.attemptFCMTokenRetrieval()
                  }
              }
          }
        )
        
        return true
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("❌ Failed to register for remote notifications: \(error.localizedDescription)")
        print("❌ This might be due to missing entitlements or running on simulator")
        
        // Check if it's an entitlements issue
        if error.localizedDescription.contains("aps-environment") {
            print("🔧 Entitlements issue detected. Make sure to:")
            print("   1. Add 'Furniture AppDebug.entitlements' to your Debug configuration in Xcode")
            print("   2. Add 'Furniture AppRelease.entitlements' to your Release configuration in Xcode")
            print("   3. Ensure your Apple Developer account has push notification capabilities")
        }
        
        // Try to get FCM token anyway for testing purposes (works without APNS in some cases)
        self.attemptFCMTokenRetrieval()
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let token = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
        print("✅ APNs device token: \(token)")
        
        // Set the APNS token for Firebase Messaging
        Messaging.messaging().apnsToken = deviceToken
        
        // Now request FCM token since APNS token is available
        self.requestFCMToken()
    }
    
    private func requestFCMToken() {
        Messaging.messaging().token { token, error in
            if let error = error {
                print("❌ Error fetching FCM registration token: \(error)")
            } else if let token = token {
                print("✅ FCM registration token: \(token)")
                // Store token for later use if needed
                UserDefaults.standard.set(token, forKey: "FCMToken")
            }
        }
    }
    
    private func attemptFCMTokenRetrieval() {
        fcmTokenRetrievalAttempts += 1
        
        if fcmTokenRetrievalAttempts > maxFCMTokenAttempts {
            print("❌ Max FCM token retrieval attempts reached")
            print("💡 Try running on a physical device with proper entitlements configuration")
            return
        }
        
        print("🔄 Attempting FCM token retrieval (attempt \(fcmTokenRetrievalAttempts)/\(maxFCMTokenAttempts))")
        
        // Try different approaches based on attempt number
        let delay = Double(fcmTokenRetrievalAttempts * 2)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            // For later attempts, try to force refresh the token
            if self.fcmTokenRetrievalAttempts > 2 {
                print("🔄 Attempting to delete and regenerate FCM token...")
                Messaging.messaging().deleteToken { error in
                    if let error = error {
                        print("⚠️ Error deleting FCM token: \(error)")
                    }
                    // Now try to get a fresh token
                    self.requestFCMTokenDirectly()
                }
            } else {
                self.requestFCMTokenDirectly()
            }
        }
    }
    
    private func requestFCMTokenDirectly() {
        Messaging.messaging().token { token, error in
            if let error = error {
                print("❌ FCM token retrieval attempt \(self.fcmTokenRetrievalAttempts) failed: \(error)")
                
                // Check for specific error types
                let nsError = error as NSError
                if nsError.code == 505 { // No APNS token specified
                    print("💡 APNS token not available, but FCM might still work for data-only messages")
                }
                
                // Try again with exponential backoff
                self.attemptFCMTokenRetrieval()
            } else if let token = token {
                print("✅ FCM registration token (attempt \(self.fcmTokenRetrievalAttempts)): \(token)")
                UserDefaults.standard.set(token, forKey: "FCMToken")
                
                // Reset attempt counter on success
                self.fcmTokenRetrievalAttempts = 0
            } else {
                print("⚠️ FCM token is nil, retrying...")
                self.attemptFCMTokenRetrieval()
            }
        }
    }
    
}

@main
struct Furniture_AppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var sessionManager = UserSessionManager()
    @StateObject var cartManager = CartManager()
    @StateObject var navManager = AppNavigationManager()
    
    var body: some Scene {
        WindowGroup {
            AppState()
                .environmentObject(navManager)
                .environmentObject(sessionManager)
                .environmentObject(cartManager)
        }
    }
}


extension AppDelegate: UNUserNotificationCenterDelegate {
    // Receive displayed notifications for iOS 10 devices.
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification) async
    -> UNNotificationPresentationOptions {
        let userInfo = notification.request.content.userInfo
        
        // With swizzling disabled you must let Messaging know about the message, for Analytics
        // Messaging.messaging().appDidReceiveMessage(userInfo)
        
        // ...
        
        // Print full message.
        print(userInfo)
        
        // Change this to your preferred presentation option
        return [[.alert, .sound]]
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse) async {
        let userInfo = response.notification.request.content.userInfo
        
        // ...
        
        // With swizzling disabled you must let Messaging know about the message, for Analytics
        // Messaging.messaging().appDidReceiveMessage(userInfo)
        
        // Print full message.
        print(userInfo)
    }
    
    @MainActor
    func application(_ application: UIApplication,
                     didReceiveRemoteNotification userInfo: [AnyHashable: Any]) async
      -> UIBackgroundFetchResult {
      // If you are receiving a notification message while your app is in the background,
      // this callback will not be fired till the user taps on the notification launching the application.
      // TODO: Handle data of notification

      // With swizzling disabled you must let Messaging know about the message, for Analytics
      // Messaging.messaging().appDidReceiveMessage(userInfo)

      // Print message ID.
      if let messageID = userInfo[gcmMessageIDKey] {
        print("Message ID: \(messageID)")
      }

      // Print full message.
      print(userInfo)
      print("Call exportDeliveryMetricsToBigQuery() from AppDelegate")
      Messaging.serviceExtension().exportDeliveryMetricsToBigQuery(withMessageInfo: userInfo)
      return UIBackgroundFetchResult.newData
    }
}

extension AppDelegate: MessagingDelegate {
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        guard let fcmToken = fcmToken else {
            print("❌ FCM token is nil")
            return
        }
        
        print("✅ Firebase registration token received: \(fcmToken)")
        
        // Store the token
        UserDefaults.standard.set(fcmToken, forKey: "FCMToken")
        
        // Post notification for other parts of the app
        let dataDict: [String: String] = ["token": fcmToken]
        NotificationCenter.default.post(
            name: Notification.Name("FCMToken"),
            object: nil,
            userInfo: dataDict
        )
        
        // TODO: Send token to your application server if needed
        // Note: This callback is fired at each app startup and whenever a new token is generated.
    }
}
