//
//  ProfileBarView.swift
//  Furniture App
//
//  Created by Owais on 1/27/25.
//

import SwiftUI
import FirebaseAuth

struct ProfileTabView: View {
    @StateObject private var viewModel = ProfileViewModel()
    @State private var isPresented: Bool = false
    @State private var path = NavigationPath()
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var sessionManager: UserSessionManager
    @EnvironmentObject var navigationManager: NavigationManager
    
    var menuItems: [MenuItem] {
        [
            MenuItem(title: "Profile", imageName: "profile") { print("Profile tapped") },
            MenuItem(title: "Payment Methods", imageName: "payment") { print("Payment Methods tapped") },
            MenuItem(title: "Order History", imageName: "order") { print("Order History tapped") },
            MenuItem(title: "Delivery History", imageName: "delivery") { print("Delivery History tapped") },
            MenuItem(title: "Support Center", imageName: "support") { print("Support Center tapped") },
            MenuItem(title: "Legal Policy", imageName: "legal") { print("Legal Policy tapped") }
        ]
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Color("AppColor").ignoresSafeArea(.all)
                
                VStack {
                    ZStack {
                        Text("Profile")
                            .font(Font.custom("Switzer-Medium", size: 20))
                            .foregroundStyle(Color.textClr)
                    }
                    .padding(.top, 8)
                    .frame(height: 48)
                    
                    ScrollView {
                        VStack(spacing: 12) {
                            Image("user")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                            
                            VStack(spacing: 4) {
                                Text(sessionManager.userName)
                                    .font(Font.custom("Switzer-Medium", size: 20))
                                    .foregroundStyle(Color.textClr)
                                
                                Text(sessionManager.userEmail
                                )
                                .font(Font.custom("Switzer-Regular", size: 14))
                                .foregroundStyle(Color.subTextClr)
                            }
                        }.padding(.vertical, 24)
                        
                        
                        
                        VStack(spacing: 16) {
                            ForEach(menuItems) { item in
                                MenuButtonView(item: item)
                            }
                            
                            // Logout Button
//                            Button {
//                                viewModel.logout(navigationManager: navigationManager)
//                                print("Log out pressed....")
//                            } label: {
//                                Text("Log Out")
//                                    .font(Font.custom("Switzer-Medium", size: 16))
//                                    .foregroundStyle(Color.logout)
//                            }
//                            .padding(.top, 12)
                            
                            
                            Button {
                                //
                            } label: {
                                HStack(spacing: 12) {
                                    Image("logout")
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                        .padding(.vertical, 16)
                                        .padding(.leading, 16)
                                    
                                    Text("Log Out")
                                        .font(Font.custom("Switzer-Medium", size: 16))
                                        .foregroundStyle(Color.textClr)
                                }
                                .frame(maxWidth: .infinity, maxHeight: 56, alignment: .leading)
                                .background(Color.white)
                                .cornerRadius(14)
                            }
                        }
                        
                        
                        
                        
                        
//                        VStack(spacing: 16) {
//                            
//                            Button {
//                                //
//                            } label: {
//                                HStack(spacing: 12) {
//                                    Image("profile")
//                                        .resizable()
//                                        .frame(width: 24, height: 24)
//                                        .padding(.vertical, 16)
//                                        .padding(.leading, 16)
//                                    
//                                    Text("Profile")
//                                        .font(Font.custom("Switzer-Medium", size: 16))
//                                        .foregroundStyle(Color.textClr)
//                                }
//                                .frame(maxWidth: .infinity, maxHeight: 56, alignment: .leading)
//                                .background(Color.white)
//                                .cornerRadius(14)
//                            }
//                            
//                            
//                            Button {
//                                
//                            } label: {
//                                HStack(spacing: 12) {
//                                    Image("payment")
//                                        .resizable()
//                                        .frame(width: 24, height: 24)
//                                        .padding(.vertical, 16)
//                                        .padding(.leading, 16)
//                                    
//                                    Text("Payment Methods")
//                                        .font(Font.custom("Switzer-Medium", size: 16))
//                                        .foregroundStyle(Color.textClr)
//                                }
//                                .frame(maxWidth: .infinity, maxHeight: 56, alignment: .leading)
//                                .background(Color.white)
//                                .cornerRadius(14)
//                            }
//                            
//                            
//                            Button {
//                                
//                            } label: {
//                                HStack(spacing: 12) {
//                                    Image("order")
//                                        .resizable()
//                                        .frame(width: 24, height: 24)
//                                        .padding(.vertical, 16)
//                                        .padding(.leading, 16)
//                                    
//                                    Text("Order History")
//                                        .font(Font.custom("Switzer-Medium", size: 16))
//                                        .foregroundStyle(Color.textClr)
//                                }
//                                .frame(maxWidth: .infinity, maxHeight: 56, alignment: .leading)
//                                .background(Color.white)
//                                .cornerRadius(14)
//                            }
//                            
//                            
//                            Button {
//                                
//                            } label: {
//                                HStack(spacing: 12) {
//                                    Image("delivery")
//                                        .resizable()
//                                        .frame(width: 24, height: 24)
//                                        .padding(.vertical, 16)
//                                        .padding(.leading, 16)
//                                    
//                                    Text("Delivery History")
//                                        .font(Font.custom("Switzer-Medium", size: 16))
//                                        .foregroundStyle(Color.textClr)
//                                }
//                                .frame(maxWidth: .infinity, maxHeight: 56, alignment: .leading)
//                                .background(Color.white)
//                                .cornerRadius(14)
//                            }
//                            
//                            
//                            Button {
//                                
//                            } label: {
//                                HStack(spacing: 12) {
//                                    Image("support")
//                                        .resizable()
//                                        .frame(width: 24, height: 24)
//                                        .padding(.vertical, 16)
//                                        .padding(.leading, 16)
//                                    
//                                    Text("Support Center")
//                                        .font(Font.custom("Switzer-Medium", size: 16))
//                                        .foregroundStyle(Color.textClr)
//                                }
//                                .frame(maxWidth: .infinity, maxHeight: 56, alignment: .leading)
//                                .background(Color.white)
//                                .cornerRadius(14)
//                            }
//                            
//                            
//                            Button {
//                                
//                            } label: {
//                                HStack(spacing: 12) {
//                                    Image("legal")
//                                        .resizable()
//                                        .frame(width: 24, height: 24)
//                                        .padding(.vertical, 16)
//                                        .padding(.leading, 16)
//                                    
//                                    Text("Legal Policy")
//                                        .font(Font.custom("Switzer-Medium", size: 16))
//                                        .foregroundStyle(Color.textClr)
//                                }
//                                .frame(maxWidth: .infinity, maxHeight: 56, alignment: .leading)
//                                .background(Color.white)
//                                .cornerRadius(14)
//                            }
//                            
//                            Button {
//                                viewModel.logout(navigationManager: navigationManager)
//                                print("Log out pressing....")
//                            } label: {
//                                Text("Log Out")
//                                    .font(Font.custom("Switzer-Medium", size: 16))
//                                    .foregroundStyle(Color.logout)
//                            }
//                            .padding(.top, 12)
//                        }
                    }
                }
                .padding(.horizontal, 24)
            }
        }
    }
}

#Preview {
    ProfileTabView()
        .environmentObject(UserSessionManager())
}
