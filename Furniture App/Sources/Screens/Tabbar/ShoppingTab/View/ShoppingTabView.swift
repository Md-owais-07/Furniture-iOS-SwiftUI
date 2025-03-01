//
//  ShoppingBarView.swift
//  Furniture App
//
//  Created by Owais on 1/27/25.
//

import SwiftUI

struct ShoppingTabView: View {
    @EnvironmentObject var cartManager: CartManager
    @State private var quantity: Int = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("AppColor").ignoresSafeArea(.all)
                
                VStack {
                    HStack(spacing: 0) {
                        TopCircularButtonView(action: {
                            //                            dismiss()
                        }, imageName: "backBtn")
                        
                        Spacer()
                        
                        Text("Shopping")
                            .font(Font.custom("Switzer-Medium", size: 20))
                            .foregroundStyle(Color.textClr)
                        
                        Spacer()
                        
                        TopCircularButtonView(action: {
                            //                            dismiss()
                        }, imageName: "bin")
                        
                    }
                    .padding(.top, 8)
                    .frame(height: 48)
                    
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
                                        
                                        //                                        Text(item.productPrice.formatted(.currency(code: "USD")))
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
                        .padding(.top, 24)
                    }
                }
                .padding(.horizontal, 24)
                .navigationBarBackButtonHidden(true)
            }
        }
    }
}

#Preview {
    ShoppingTabView()
        .environmentObject(CartManager())
}
