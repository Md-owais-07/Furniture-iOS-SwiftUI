//
//  CheckoutView.swift
//  Furniture App
//
//  Created by Owais on 4/21/25.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var navManager: AppNavigationManager
    @EnvironmentObject var cartManager: FinalCartManager
    
    @State private var isEdit: Bool = false
    @State private var selectedPayment = checkoutData[0]
    @State private var selectedAddress = addressData[0]
    
    
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
                
                ScrollView(showsIndicators: false) {
                    // Address View
                    VStack {
                        Text("Shipping To")
                            .font(Font.custom("Switzer-Medium", size: 20))
                            .foregroundStyle(Color.textClr)
                            .frame(maxWidth: .infinity, maxHeight: 44, alignment: .topLeading)
                            .padding(.top, 24)
                            .padding(.bottom, 16)
                        
                        VStack(spacing: 16) {
                            ForEach(addressData) { data in
                                AddressView(
                                    data: data,
                                    isSelected: selectedAddress.id == data.id,
                                    isEdit: $isEdit,
                                    action: {
                                        selectedAddress = data
                                    }
                                )
                            }
                        }
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 24)
                    
                    // Payment Method
                    VStack {
                        Text("Payment Method")
                            .font(Font.custom("Switzer-Medium", size: 20))
                            .foregroundStyle(Color.textClr)
                            .frame(maxWidth: .infinity, maxHeight: 44, alignment: .topLeading)
                        
                        VStack(spacing: 6) {
                            ForEach(Array(checkoutData.enumerated()), id: \.element.id) { index, data in
                                PaymentReusableView(
                                    data: data,
                                    isSelected: selectedPayment.id == data.id,
                                    isLastItem: index == checkoutData.indices.last
                                ) {
                                    if index == checkoutData.indices.last {
                                        // Navigation
                                        navManager.push(.shoppingTab(.paymentMethods))
                                    } else {
                                        selectedPayment = data
                                    }
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 24)
                    .padding(.bottom, 16)
                }
                
                VStack(spacing: 0) {
                    VStack(spacing: 0) {
                            Text("Amount")
                                .font(Font.custom("Switzer-Medium", size: 20))
                                .foregroundStyle(Color.textClr)
                                .frame(maxWidth: .infinity, maxHeight: 24, alignment: .leading)
                                .padding(.bottom, 16)
                                .frame(height: 40)
                        
                        VStack(spacing: 8) {
                            HStack {
                                Text("Item Total")
                                    .font(Font.custom("Switzer-Regular", size: 16))
                                    .foregroundStyle(Color.subTextClr)
                                
                                Spacer()
                                
                                Text("$\(cartManager.totalPayment, specifier: "%.2f")")
                                    .font(Font.custom("Switzer-Regular", size: 16))
                                    .foregroundStyle(Color.primaryButton)
                            }
                            .frame(height: 24)
                            
                            HStack {
                                Text("Delivery Fee")
                                    .font(Font.custom("Switzer-Regular", size: 16))
                                    .foregroundStyle(Color.subTextClr)
                                
                                Spacer()
                                
                                Text("$\(cartManager.deliveryFees, specifier: "%.2f")")
                                    .font(Font.custom("Switzer-Regular", size: 16))
                                    .foregroundStyle(Color.primaryButton)
                            }
                            .frame(height: 24)
                        }
                        .frame(maxWidth: .infinity)
                        
                        Rectangle()
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .foregroundStyle(Color("buttonShapeColor"))
                            .padding(.top, 8)
                        
                        HStack {
                            Text("Total")
                                .font(Font.custom("Switzer-Semibold", size: 16))
                                .foregroundStyle(Color.textClr)
                            
                            Spacer()
                            
                            Text("$\(cartManager.grandTotalPayment, specifier: "%.2f")")
                                .font(Font.custom("Switzer-Semibold", size: 16))
                                .foregroundStyle(Color.primaryButton)
                        }
                        .padding(.top, 20)
                        .frame(maxWidth: .infinity)
                        .frame(height: 24)
                    }
                    .padding(.vertical, 24)
                    
                    Spacer()
                    
                    CustomButtonView(action: {
                        navManager.push(.shoppingTab(.payment(selectedPayment)))
                    }, title: "Payment")
                    .padding(.bottom, 40)
                    
                }
                .padding(.horizontal, 24)
                .frame(maxWidth: .infinity)
                .frame(height: 268)
                .background(.white)
                .clipShape(RoundedCorner(radius: 24, corners: [.topLeft, .topRight]))
            }
            .navigationBarBackButtonHidden(true)
            .background(EnableSwipeBackGesture())
            .ignoresSafeArea(.all, edges: .bottom)
        }
    }
}


#Preview {
    CheckoutView()
        .environmentObject(FinalCartManager())
        .environmentObject(AppNavigationManager())
}
