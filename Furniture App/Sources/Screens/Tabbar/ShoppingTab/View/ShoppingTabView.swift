//
//  ShoppingBarView.swift
//  Furniture App
//
//  Created by Owais on 1/27/25.
//

import SwiftUI

struct ShoppingTabView: View {
    @State private var quantity: Int = 0
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var navManager: AppNavigationManager
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ZStack {
            Color("AppColor").ignoresSafeArea(.all)
            
            VStack(spacing: 0) {
                VStack {
                    // Top Header View
                    ZStack {
                        ZStack {
                            Text("Shopping")
                                .font(Font.custom("Switzer-Medium", size: 20))
                                .foregroundStyle(Color.textClr)
                        }
                        
                        HStack {
                            Spacer()
                            
                            TopCircularButtonView(action: {
                                
                            }, imageName: "bin")
                        }
                    }
                    
                    Spacer()
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 24) {
                            ForEach(cartManager.items) { item in
                                HStack(spacing: 0) {
                                    ZStack {
                                        Image(item.productImage)
                                            .resizable()
                                            .frame(width: 45, height: 50)
                                    }
                                    .frame(width: 72, height: 72)
                                    .background(Color.buttonShape)
                                    .cornerRadius(12)
                                    .padding(.leading, 16)
                                    
                                    VStack(spacing: 0) {
                                        VStack(spacing: 6) {
                                            Text(item.productTitle)
                                                .font(Font.custom("Switzer-Semibold", size: 16))
                                                .foregroundStyle(Color.textClr)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                            
                                            Text(item.productSubTitle)
                                                .font(Font.custom("Switzer-Regular", size: 13))
                                                .foregroundStyle(Color.subTextClr)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                        }
                                        
                                        Text("$\(cartManager.totalPrice, specifier: "%.2f")")
                                            .font(Font.custom("Switzer-Medium", size: 16))
                                            .foregroundStyle(Color.primaryButton)
                                            .padding(.top, 12)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                    .padding(.top, 4)
                                    .padding(.leading, 12)
                                    
                                    Spacer()
                                    
                                    HStack {
                                        ProductQuantityButton(quantity: $quantity)
                                    }
                                    .padding(.trailing, 16)
                                }
                                .frame(height: 104)
                                .background(.white)
                                .cornerRadius(14)
                            }
                        }
                        .padding(.vertical, 24)
                    }
                }
                .padding(.horizontal, 24)
                
                if cartManager.items.isEmpty {
                    //
                } else {
                    VStack(spacing: 0) {
                        VStack(spacing: 0) {
                            VStack {
                                Text("Order Summary")
                                    .font(Font.custom("Switzer-Medium", size: 16))
                                    .foregroundStyle(Color.textClr)
                                    .frame(maxWidth: .infinity, maxHeight: 24, alignment: .leading)
                                    .padding(.bottom, 16)
                            }
                            .frame(height: 40)
                            
                            VStack(spacing: 8) {
                                HStack {
                                    Text("Subtotal")
                                        .font(Font.custom("Switzer-Regular", size: 16))
                                        .foregroundStyle(Color.subTextClr)
                                    
                                    Spacer()
                                    
                                    Text("$920")
                                        .font(Font.custom("Switzer-Regular", size: 16))
                                        .foregroundStyle(Color.primaryButton)
                                }
                                .frame(height: 24)
                                
                                HStack {
                                    Text("Shipping Cost")
                                        .font(Font.custom("Switzer-Regular", size: 16))
                                        .foregroundStyle(Color.subTextClr)
                                    
                                    Spacer()
                                    
                                    Text("$920")
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
                                Text("Total Payment")
                                    .font(Font.custom("Switzer-Semibold", size: 16))
                                    .foregroundStyle(Color.textClr)
                                
                                Spacer()
                                
                                Text("$978")
                                    .font(Font.custom("Switzer-Semibold", size: 16))
                                    .foregroundStyle(Color.primaryButton)
                            }
                            .padding(.top, 20)
                            .frame(maxWidth: .infinity, maxHeight: 24, alignment: .leading)
                            
                        }
                        .padding([.horizontal, .vertical], 24)
                        
                        Spacer()
                        
                        CustomButtonView(action: {
                            navManager.push(.shoppingTab(.checkout))
                        }, title: "Check Out")
                        .padding(.horizontal, 24)
                        .padding(.bottom, 14)
                    }
                    .frame(maxWidth: .infinity, maxHeight: 268)
                    .background(.white)
                    .clipShape(RoundedCorner(radius: 24, corners: [.topLeft, .topRight]))
                }
            }
            
            ZStack {
                VStack(spacing: -10) {
                    if cartManager.items.isEmpty {
                        LottieView(animationName: "cart2", play: true, loopMode: .loop)
                            .frame(width: 180, height: 180)
                        
                        Text("Your cart is empty")
                            .font(Font.custom("Switzer-Regular", size: 16))
                            .foregroundStyle(Color.subTextClr)
                    }
                }
            }
        }
    }
}

#Preview {
    ShoppingTabView()
        .environmentObject(CartManager())
}
