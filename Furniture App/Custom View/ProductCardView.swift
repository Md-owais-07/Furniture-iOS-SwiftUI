//
//  ProductCardView.swift
//  Furniture App
//
//  Created by Owais on 1/29/25.
//

import SwiftUI

struct ProductCardView: View {
    var product: Products
    
    @EnvironmentObject var cartManager: CartManager
    @State private var isAddedToCart: Bool = false
    @State private var quantity: Int = 0
    @ObservedObject var manager = CartManager()
    
    var body: some View {
        ZStack() {
            Color.white
            ZStack() {
                Color.white
                VStack() {
                    Image(product.productImage)
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: 86, maxHeight: 120)
                        .padding(.bottom, 20)
                    
                    HStack(spacing: 0) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(product.productTitle)
                                .font(Font.custom("Switzer-Semibold", size: 16))
                                .foregroundStyle(.textClr)
                            
                            Text(product.productSubTitle)
                                .font(Font.custom("Switzer-Regular", size: 13))
                                .foregroundStyle(.subTextClr)
                        }
                        
                    }.frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    
                    HStack(spacing: 0) {
                        Text(product.productPrice.formatted(.currency(code: "USD")))
                            .font(Font.custom("Switzer-Medium", size: 16))
                            .foregroundStyle(.primaryButton)
                            .frame(height: 32)
                        
                        Spacer()
                        
                        Button {
                            if quantity == 0 {
                                isAddedToCart = true
                                quantity += 1
                                cartManager.addToCart(product)
                            } else {
                                quantity -= 1
                                isAddedToCart = false
                                cartManager.removeFromCart(product)
                            }
                        } label: {
                            if quantity > 0 {
                                ProductQuantityButton(quantity: $quantity)
                            } else {
                                Image("addToCart")
                                    .scaledToFit()
                                    .frame(width: 32, height: 32)
                                    .background(Color("primaryColor"))
                                    .clipShape(Circle())
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding([.horizontal, .vertical], 16)
        }
        .frame(width: 212, height: 255)
        .cornerRadius(14)
        .padding(.leading, 24)
    }
}

#Preview {
    ProductCardView(product: productsDataArray[0])
        .environmentObject(CartManager())
}
