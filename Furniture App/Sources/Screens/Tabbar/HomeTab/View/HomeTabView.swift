//
//  HomePageView.swift
//  Furniture App
//
//  Created by Owais on 1/27/25.
//

import SwiftUI

struct HomeTabView: View {
    @State private var searchText: String = ""
    
    @EnvironmentObject var sessionManager: UserSessionManager
    @EnvironmentObject var navManager: AppNavigationManager
    
    var body: some View {
        ZStack {
            Color("AppColor").ignoresSafeArea(.all)
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    //  Header View
                    HStack(spacing: 12) {
                        CircularImageView(imageName: "user")
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Welcome,")
                                .font(Font.custom("Switzer-Regular", size: 13))
                                .foregroundStyle(.subTextClr)
                            Text(sessionManager.userName)
                                .font(Font.custom("Switzer-Medium", size: 16))
                                .foregroundStyle(.textClr)
                        }
                        
                        Spacer()
                        
                        TopCircularButtonView(action: {
                            navManager.push(.homeTab(.notifications))
                        }, imageName: "notification")
                    }
                    .padding(.top, 8).padding(.horizontal, 24)
                    
                    //  Search View
                    HStack {
                        HStack {
                            Image("search")
                                .resizable()
                                .frame(width: 20, height: 20)
                            
                            NavigationLink {
                                SearchBarActionView()
                            } label: {
                                Text("Search Furniture")
                                    .font(Font.custom("Switzer-Regular", size: 16))
                                    .foregroundStyle(.subTextClr)
                                    .frame(height: 48)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            
                            Spacer()
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 16)
                    }
                    .background(.white)
                    .cornerRadius(12)
                    .padding(.top, 24)
                    .padding(.horizontal, 24)
                    
                    VStack(spacing: 0) {
                        //  Text
                        Text("Special Offers")
                            .font(Font.custom("Switzer-Semibold", size: 16))
                            .foregroundStyle(.textClr)
                            .padding(.top, 24)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 24)
                        
                        // Image Horizontal Scrolling
                        ImageScrollView()
                            .padding(.top, 16)
                        
                        //   Ctegory view
                        CategoryListView(product: productsDataArray[0])
                            .padding(.vertical, 24)
                    }
                    
                    // Popular collection
                    HStack {
                        Text("Popular")
                            .font(Font.custom("Switzer-Semibold", size: 16))
                            .foregroundStyle(Color.textClr)
                        
                        Spacer()
                        
                        //                        Button {
                        //                            //
                        //                        } label: {
                        //                            Text("View All")
                        //                                .font(Font.custom("Switzer-Regular", size: 13))
                        //                                .foregroundStyle(Color.primaryButton)
                        //                        }
                        NavigationLink {
                            MostCategoryView(title: "Popular")
                        } label: {
                            Text("View All")
                                .font(Font.custom("Switzer-Regular", size: 13))
                                .foregroundStyle(Color.primaryButton)
                        }
                    }
                    .padding(.horizontal, 24)
                    .padding(.bottom, 16)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: -8) {
                            ForEach(productsDataArray) { product in
                                //                                PopularProductView(products: product)
                                NavigationLink {
                                    ProductDetailView(product: product)
                                } label: {
                                    PopularProductView(products: product)
                                }
                                
                            }
                        }
                    }
                    .padding(.bottom, 24)
                    
                    //                    ScrollView(.horizontal, showsIndicators: false) {
                    //                        HStack(spacing: 16) {
                    //                            ForEach(filteredProducts) { product in
                    //                                NavigationLink(destination: ProductDetailView(product: product)) {
                    //                                    ProductCardView(product: product)
                    //                                }
                    //                            }
                    //                        }
                    //                        .padding(.horizontal, 24)
                    //                    }
                }
            }
            .padding(.top, 6)
        }
    }
}

#Preview {
    HomeTabView()
        .environmentObject(UserSessionManager())
        .environmentObject(AppNavigationManager())
}
