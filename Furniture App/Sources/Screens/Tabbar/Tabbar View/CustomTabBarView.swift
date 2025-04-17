//
//  CustomTabBarView.swift
//  Furniture App
//
//  Created by Owais on 1/27/25.
//

import SwiftUI

struct CustomTabBarView: View {
    @State private var selectedTab: Tab = .home
    
    enum Tab: String, CaseIterable {
        case home = "home"
        case favourite = "favourite"
        case scan = "scan"
        case shopping = "cart"
        case profile = "profile"
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
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
//        .background(EnableSwipeBackGesture())
    }
    
//    private func tabButton(for tab: Tab) -> some View {
//        Button(action: {
//            withAnimation { selectedTab = tab }
//        }) {
//            VStack(spacing: 5) {
//                Image(tab.rawValue)
//                    .resizable()
//                    .renderingMode(.template)
//                    .scaledToFit()
//                    .frame(width: 20, height: 20)
//                    .foregroundColor(selectedTab == tab ? Color("primaryColor") : Color("subTextClr"))
//                
//                Text(tabTitle(for: tab))
//                    .font(.system(size: 12, weight: .medium))
//                    .foregroundColor(selectedTab == tab ? Color("primaryColor") : Color("subTextClr"))
//            }
//        }
//        .frame(maxWidth: .infinity)
//    }
    
    private func tabButton(for tab: Tab) -> some View {
        Button(action: {
            withAnimation { selectedTab = tab }
        }) {
            if tab == .scan {
                VStack {
                    ZStack {
                        //                        RoundedRectangle(cornerRadius: 70)
                        //                            .fill(Color("AppColor"))
                        //                            .frame(width: 70, height: 65)
                        //                            .clipShape(Rectangle().offset(y: 30))
                        //                            .offset(y: 3)
                        
                        Circle()
                            .fill(Color("primaryColor"))
                            .frame(width: 48, height: 48)
                        //                                                    .shadow(color: Color("primaryColor").opacity(0.3), radius: 10, x: 0, y: 4)
                        
                        Image(tab.rawValue)
                            .resizable()
                            .renderingMode(.template)
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.white)
                    }
                }
                //                .offset(y: -35)
            } else {
                VStack(spacing: 5) {
                    Image(tab.rawValue)
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(selectedTab == tab ? Color("primaryColor") : Color("subTextClr"))
                    
                    Text(tabTitle(for: tab))
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(selectedTab == tab ? Color("primaryColor") : Color("subTextClr"))
                }
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    private func tabTitle(for tab: Tab) -> String {
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
        .environmentObject(UserSessionManager())
        .environmentObject(CartManager())
}
