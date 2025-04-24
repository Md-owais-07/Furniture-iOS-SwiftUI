//
//  AppState.swift
//  Furniture App
//
//  Created by Owais on 2/24/25.
//

import SwiftUI

struct AppState: View {
    @EnvironmentObject var sessionManager: UserSessionManager
    @EnvironmentObject var appNavigation: AppNavigationManager
    
    var body: some View {
        NavigationStack(path: $appNavigation.path) {
            Group {
                if !sessionManager.hasSeenOnboarding {
                    ContentView()
                } else if !sessionManager.isLoggedIn {
                    LoginView()
                } else {
                    CustomTabBarView()
                }
            }
            .navigationDestination(for: AppRoute.self) { route in
                switch route {
                case .auth(let authRoute):
                    authDestination(authRoute)
                    
                case .tabbar(let tabbarRoute):
                    tabbarDestination(tabbarRoute)
                    
                case .homeTab(let homeRoute):
                    homeTabDestination(homeRoute)
                    
                case .favouriteTab(let favouriteRoute):
                    favouriteTabDestination(favouriteRoute)
                    
                case .shoppingTab(let shoppingRoute):
                    shoppingTabDestination(shoppingRoute)
                    
                case .profileTab(let profileRoute):
                    profileTabDestination(profileRoute)
                }
            }
        }
    }
}
