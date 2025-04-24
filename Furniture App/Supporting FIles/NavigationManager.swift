//
//  NavigationManager.swift
//  Furniture App
//
//  Created by Owais on 2/21/25.
//

import SwiftUI

class NavigationManager: ObservableObject {
    
    @Published var path = NavigationPath()
        
    func navigateTo(_ destination: AnyHashable) {
        path.append(destination)
    }
        
    func goBack() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    func resetToLogin() {
        path = NavigationPath()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    @Published var homePath = HomeTabView()
//    @Published var favouritePath = FavouriteTabView()
//    @Published var shoppingPath = ShoppingTabView()
//    @Published var profilePath = ProfileTabView()
//    
//    func navigateTo(_ destination: AnyHashable, in tab: Tab) {
//            switch tab {
//            case .home:
//                homePath.append(destination)
//            case .profile:
//                profilePath.append(destination)
//            case .shopping:
//                shoppingPath.append(destination)
//            case .favourite:
//                favouritePath.append(destination)
//            }
//        }
//    
//    func goBack(in tab: Tab) {
//            switch tab {
//            case .home:
//                if !homePath.isEmpty { homePath.removeLast() }
//            case .profile:
//                if !profilePath.isEmpty { profilePath.removeLast() }
//            case .shopping:
//                if !shoppingPath.isEmpty { shoppingPath.removeLast() }
//            }
//        }
//        
//        enum Tab {
//            case home, profile, shopping, favourite
//        }
}


enum AppRoute1: Hashable {
    case tabbar
}
