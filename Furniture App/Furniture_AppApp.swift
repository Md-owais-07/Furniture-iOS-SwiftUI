//
//  Furniture_AppApp.swift
//  Furniture App
//
//  Created by Owais on 1/25/25.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct Furniture_AppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var sessionManager = UserSessionManager()
    @StateObject var cartManager = CartManager()
    
    var body: some Scene {
        WindowGroup {
            AppState()
                .environmentObject(sessionManager)
                .environmentObject(cartManager)
        }
    }
}
