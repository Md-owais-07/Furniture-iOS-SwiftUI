//
//  AppState.swift
//  Furniture App
//
//  Created by Owais on 2/24/25.
//

import SwiftUI

struct AppState: View {
    @EnvironmentObject var sessionManager: UserSessionManager
    
    var body: some View {
        Group {
            if !sessionManager.hasSeenOnboarding {
                ContentView()
            } else if !sessionManager.isLoggedIn {
                LoginView()
            } else {
                CustomTabBarView()
            }
        }
    }
}
