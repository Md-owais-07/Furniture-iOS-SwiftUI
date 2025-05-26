//
//  CustomTabBarView.swift
//  Furniture App
//
//  Created by Owais on 1/27/25.
//

import SwiftUI

struct CustomTabBarView: View {
    @EnvironmentObject var appNavigation: AppNavigationManager
    
    public enum Tab: String, CaseIterable {
        case home = "home"
        case favourite = "favourite"
        case scan = "scan"
        case shopping = "cart"
        case profile = "profile"
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $appNavigation.selectedTab) {
                HomeTabView()
                    .tag(Tab.home)
                
                FavouriteTabView()
                    .tag(Tab.favourite)
                
                ScanTabView()
                    .tag(Tab.scan)
                
                ShoppingTabView()
                    .tag(Tab.shopping)
                
                ProfileTabView()
                    .tag(Tab.profile)
            }
            
            // Custom Tab Bar
            VStack(spacing: 0) {
                HStack(spacing: -10) {
                    ForEach(Tab.allCases, id: \.self) { tab in
                        tabButton(for: tab)
                    }
                }
                
                .padding(.bottom, -10)
                .frame(height: 50)
                .background(Color.white)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    public func tabButton(for tab: Tab) -> some View {
        Button(action: {
            withAnimation {
                appNavigation.selectedTab = tab
            }
        }) {
            if tab == .scan {
                VStack {
                    ZStack {
                        Circle()
                            .fill(Color("primaryColor"))
                            .frame(width: 48, height: 48)
                        
                        Image(tab.rawValue)
                            .resizable()
                            .renderingMode(.template)
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.white)
                    }
                }
                
            } else {
                VStack(spacing: 5) {
                    Image(tab.rawValue)
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(appNavigation.selectedTab == tab ? Color("primaryColor") : Color("subTextClr"))
                    
                    Text(tabTitle(for: tab))
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(appNavigation.selectedTab == tab ? Color("primaryColor") : Color("subTextClr"))
                }
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    public func tabTitle(for tab: Tab) -> String {
        switch tab {
        case .home: return "Home"
        case .favourite: return "Favourite"
        case .scan: return "Scan"
        case .shopping: return "Shopping"
        case .profile: return "Profile"
        }
    }
}


#Preview {
    CustomTabBarView()
        .environmentObject(AppNavigationManager())
        .environmentObject(UserSessionManager())
        .environmentObject(CartManager())
}



//import SwiftUI
//import Combine // Import Combine for older iOS compatibility
//
//struct CustomTabBarView: View {
//    @State private var selectedTab: Tab = .home
//    @State private var isTabBarHidden: Bool = false
//    @State private var tabViewOffset: CGFloat = 0
//
//    enum Tab: String, CaseIterable {
//        case home = "home"
//        case favourite = "favourite"
//        case scan = "scan"
//        case shopping = "cart"
//        case profile = "profile"
//    }
//
//    var body: some View {
//        ZStack(alignment: .bottom) {
//            TabView(selection: $selectedTab) {
//                NavigationView {
//                    HomeTabView(isTabBarHidden: $isTabBarHidden)
//                }
//                .tag(Tab.home)
//
//                NavigationView {
//                    FavouriteTabView()
//                }
//                .tag(Tab.favourite)
//
//                NavigationView {
//                    ScanTabView()
//                }
//                .tag(Tab.scan)
//
//                NavigationView {
//                    ShoppingTabView()
//                }
//                .tag(Tab.shopping)
//
//                NavigationView {
//                    ProfileTabView()
//                }
//                .tag(Tab.profile)
//            }
//            .tabViewStyle(.tabBarOnly)
//            .edgesIgnoringSafeArea(.bottom)
//            .offset(y: tabViewOffset) // Apply offset to TabView
//            .onChange(of: selectedTab) { newTab in
//                withAnimation {
//                    isTabBarHidden = (newTab != .home)
//                    tabViewOffset = isTabBarHidden ? 100 : 0 // Adjust offset value
//                }
//            }
//
//            // Custom Tab Bar
//            if !isTabBarHidden {
//                VStack(spacing: 0) {
//                    HStack(spacing: -10) {
//                        ForEach(Tab.allCases, id: \.self) { tab in
//                            tabButton(for: tab)
//                        }
//                    }
//                    .padding(.bottom, -10)
//                    .frame(height: 50)
//                    .background(Color.white)
//                }
//                .transition(.move(edge: .bottom).combined(with: .opacity))
//                .animation(.easeInOut, value: isTabBarHidden)
//            }
//        }
//        .navigationBarBackButtonHidden(true)
//    }
//
//    private func tabButton(for tab: Tab) -> some View {
//        Button(action: {
//            withAnimation { selectedTab = tab }
//        }) {
//            if tab == .scan {
//                VStack {
//                    ZStack {
//                        Circle()
//                            .fill(Color("primaryColor"))
//                            .frame(width: 48, height: 48)
//
//                        Image(tab.rawValue)
//                            .resizable()
//                            .renderingMode(.template)
//                            .scaledToFit()
//                            .frame(width: 24, height: 24)
//                            .foregroundColor(.white)
//                    }
//                }
//            } else {
//                VStack(spacing: 5) {
//                    Image(tab.rawValue)
//                        .resizable()
//                        .renderingMode(.template)
//                        .scaledToFit()
//                        .frame(width: 20, height: 20)
//                        .foregroundColor(selectedTab == tab ? Color("primaryColor") : Color("subTextClr"))
//
//                    Text(tabTitle(for: tab))
//                        .font(.system(size: 12, weight: .medium))
//                        .foregroundColor(selectedTab == tab ? Color("primaryColor") : Color("subTextClr"))
//                }
//            }
//        }
//        .frame(maxWidth: .infinity)
//    }
//
//    private func tabTitle(for tab: Tab) -> String {
//        switch tab {
//        case .home: return "Home"
//        case .favourite: return "Favourite"
//        case .scan: return "Scan"
//        case .shopping: return "Shopping"
//        case .profile: return "Profile"
//        }
//    }
//}
//
//
//#Preview {
//    CustomTabBarView()
//        .environmentObject(UserSessionManager())
//        .environmentObject(CartManager())
//}


//import SwiftUI
//
//struct CustomTabBarView: View {
//    @State private var selectedTab: Tab = .home
//    @State private var isTabBarHidden: Bool = true
//
//    enum Tab: String, CaseIterable {
//        case home = "home"
//        case favourite = "favourite"
//        case scan = "scan"
//        case shopping = "cart"
//        case profile = "profile"
//    }
//
//    var body: some View {
//        ZStack(alignment: .bottom) {
//            TabView(selection: $selectedTab) {
//                NavigationStack {
//                    HomeTabView(isTabBarHidden: $isTabBarHidden)
//                }
//                .tag(Tab.home)
//
//                NavigationStack {
//                    FavouriteTabView()
//                }
//                .tag(Tab.favourite)
//
//                NavigationStack {
//                    ScanTabView()
//                }
//                .tag(Tab.scan)
//
//                NavigationStack {
//                    ShoppingTabView()
//                }
//                .tag(Tab.shopping)
//
//                NavigationStack {
//                    ProfileTabView()
//                }
//                .tag(Tab.profile)
//            }
//
////            if !isTabBarHidden {
////                tabBar
////                    .opacity(isTabBarHidden ? 0 : 1)
////                    .offset(y: isTabBarHidden ? 100 : 0)
////                    .animation(.easeInOut(duration: 0.3), value: isTabBarHidden)
////                    .allowsHitTesting(!isTabBarHidden)
////                
////            }
//            
//            VStack(spacing: 0) {
//                HStack(spacing: -10) {
//                    ForEach(Tab.allCases, id: \.self) { tab in
//                        tabButton(for: tab)
//                    }
//                }
//                .padding(.bottom, -10)
//                .frame(height: 50)
//                .background(Color.white)
//            }
//            .opacity(isTabBarHidden ? 0 : 1)
//            .allowsHitTesting(!isTabBarHidden) // 💡 Disables touch if hidden
//            .animation(.easeInOut, value: isTabBarHidden)
//
//        }
//    }
//
//    private var tabBar: some View {
//        VStack(spacing: 0) {
//            HStack(spacing: -10) {
//                ForEach(Tab.allCases, id: \.self) { tab in
//                    tabButton(for: tab)
//                }
//            }
//            .padding(.bottom, -10)
//            .frame(height: 50)
//            .background(Color.white)
//        }
//    }
//
//    private func tabButton(for tab: Tab) -> some View {
//        Button {
//            withAnimation {
//                selectedTab = tab
//                isTabBarHidden = false // Show tab bar when switching tabs
//            }
//        } label: {
//            if tab == .scan {
//                VStack {
//                    ZStack {
//                        Circle()
//                            .fill(Color("primaryColor"))
//                            .frame(width: 48, height: 48)
//
//                        Image(tab.rawValue)
//                            .resizable()
//                            .renderingMode(.template)
//                            .scaledToFit()
//                            .frame(width: 24, height: 24)
//                            .foregroundColor(.white)
//                    }
//                }
//            } else {
//                VStack(spacing: 5) {
//                    Image(tab.rawValue)
//                        .resizable()
//                        .renderingMode(.template)
//                        .scaledToFit()
//                        .frame(width: 20, height: 20)
//                        .foregroundColor(selectedTab == tab ? Color("primaryColor") : Color("subTextClr"))
//
//                    Text(tabTitle(for: tab))
//                        .font(.system(size: 12, weight: .medium))
//                        .foregroundColor(selectedTab == tab ? Color("primaryColor") : Color("subTextClr"))
//                }
//            }
//        }
//        .frame(maxWidth: .infinity)
//    }
//
//    private func tabTitle(for tab: Tab) -> String {
//        switch tab {
//        case .home: return "Home"
//        case .favourite: return "Favourite"
//        case .scan: return "Scan"
//        case .shopping: return "Shopping"
//        case .profile: return "Profile"
//        }
//    }
//}
//
//
//#Preview {
//    CustomTabBarView()
//        .environmentObject(UserSessionManager())
//        .environmentObject(CartManager())
//}
