//
//  CheckoutView.swift
//  Furniture App
//
//  Created by Owais on 4/21/25.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var navManager: AppNavigationManager
    @EnvironmentObject var cartManager: CartManager
    
    @State private var isEdit: Bool = false
    
    var body: some View {
        ZStack {
            Color("AppColor").ignoresSafeArea(.all)
            
            VStack(spacing: 0) {
                // Top Header View
                ZStack {
                    HStack {
                        TopCircularButtonView(action: {
                            navManager.pop()
                        }, imageName: "backBtn")
                        
                        Spacer()
                    }
                    
                    ZStack {
                        Text("Checkout")
                            .font(Font.custom("Switzer-Medium", size: 20))
                            .foregroundStyle(Color.textClr)
                    }
                }
                .padding(.horizontal, 24)
                
                ScrollView {
                    VStack {
                        VStack {
                            Text("Shipping To")
                                .font(Font.custom("Switzer-Medium", size: 20))
                                .foregroundStyle(Color.textClr)
                                .frame(maxWidth: .infinity, maxHeight: 44, alignment: .topLeading)
                        }
                        .padding(.top, 24)
                        .padding(.bottom, 16)
                        
                        VStack(spacing: 16) {
                            Button {
                                print("hello 1")
                            } label: {
                                AddressView(action: {
                                    print("hello 1...")
                                }, image: "check", title: "Home Address", phoneNumber: "+91 9565785432", address: "Hsr layout, bangalore", isEdit: $isEdit)
                            }
                            
                            Button {
                                print("hello 2")
                            } label: {
                                AddressView(action: {
                                    print("hello 2...")
                                }, image: "uncheck", title: "Office Address", phoneNumber: "+91 9565785432", address: "Hsr layout, bangalore", isEdit: $isEdit)
                            }
                            
                        }
                        
                    }
                    .padding(.horizontal, 24)
                    
                    ZStack {
                        
                    }.frame(maxWidth: .infinity, maxHeight: 24)
                    
                    VStack {
                        VStack {
                            Text("Payment Method")
                                .font(Font.custom("Switzer-Medium", size: 20))
                                .foregroundStyle(Color.textClr)
                                .frame(maxWidth: .infinity, maxHeight: 44, alignment: .topLeading)
                            
                            VStack(spacing: 16) {
                                PaymentReusableView(action: {
                                    //
                                }, image: "p1", title: "Credit Card", toggleImage: "check")
                                
                                PaymentReusableView(action: {
                                    //
                                }, image: "p2", title: "Paypal", toggleImage: "uncheck")
                                
                                PaymentReusableView(action: {
                                    //
                                }, image: "p3", title: "Apple Pay", toggleImage: "uncheck")
                                
                                PaymentReusableView(action: {
                                    //
                                }, image: "all", title: "Others", toggleImage: "next")
                            }
                        }
                    }
                    .frame(height: 268)
                    .padding(.horizontal, 24)
                    .padding(.bottom, 16)
                }
                .scrollIndicators(.hidden)
                
                VStack(spacing: 0) {
                    VStack(spacing: 0) {
                        VStack {
                            Text("Amount")
                                .font(Font.custom("Switzer-Medium", size: 20))
                                .foregroundStyle(Color.textClr)
                                .frame(maxWidth: .infinity, maxHeight: 24, alignment: .leading)
                                .padding(.bottom, 16)
                        }
                        .frame(height: 40)
                        
                        VStack(spacing: 8) {
                            HStack {
                                Text("Item Total")
                                    .font(Font.custom("Switzer-Regular", size: 16))
                                    .foregroundStyle(Color.subTextClr)
                                
                                Spacer()
                                
                                Text("$\(cartManager.totalPrice, specifier: "%.2f")")
                                    .font(Font.custom("Switzer-Regular", size: 16))
                                    .foregroundStyle(Color.primaryButton)
                            }
                            .frame(height: 24)
                            
                            HStack {
                                Text("Delivery Fee")
                                    .font(Font.custom("Switzer-Regular", size: 16))
                                    .foregroundStyle(Color.subTextClr)
                                
                                Spacer()
                                
                                Text("$\(cartManager.shippingCharge, specifier: "%.2f")")
                                    .font(Font.custom("Switzer-Regular", size: 16))
                                    .foregroundStyle(Color.primaryButton)
                            }
                            .frame(height: 24)
                        }
                        .frame(maxWidth: .infinity, maxHeight: 64, alignment: .leading)
                        
                        HStack {
                            Rectangle()
                                .frame(maxWidth: .infinity, maxHeight: 1)
                                .foregroundStyle(Color("buttonShapeColor"))
                        }
                        .padding(.top, 8)
                        
                        
                        HStack {
                            Text("Total")
                                .font(Font.custom("Switzer-Semibold", size: 16))
                                .foregroundStyle(Color.textClr)
                            
                            Spacer()
                            
                            Text("$\(cartManager.total, specifier: "%.2f")")
                                .font(Font.custom("Switzer-Semibold", size: 16))
                                .foregroundStyle(Color.primaryButton)
                        }
                        .padding(.top, 20)
                        .frame(maxWidth: .infinity, maxHeight: 24, alignment: .leading)
                        
                    }
                    .padding(.vertical, 24)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    
                    CustomButtonView(action: {
                        navManager.push(.shoppingTab(.payment))
                    }, title: "Payment")
                    .padding(.bottom, 40)
                    
                }
                .padding(.horizontal, 24)
                .frame(maxWidth: .infinity, maxHeight: 268)
                .background(.white)
                .clipShape(RoundedCorner(radius: 24, corners: [.topLeft, .topRight]))
            }
        }
        .navigationBarBackButtonHidden(true)
        .background(EnableSwipeBackGesture())
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

#Preview {
    CheckoutView()
        .environmentObject(CartManager())
}
