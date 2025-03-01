//
//  AddToCartView.swift
//  Furniture App
//
//  Created by Owais on 2/26/25.
//

import SwiftUI

struct AddToCartView: View {
//    @EnvironmentObject var cartManager: CartManager
    @State private var quantity: Int = 0
    
    var image: String = ""
    var title: String = ""
    var subtitle: String = ""
    var price: Double = 0.0
    
    var body: some View {
        ZStack {
            Color.white
                
            VStack(spacing: 0) {
//                ForEach(cartManager.items) { cartItem in
                    HStack(spacing: 0) {
                        ZStack {
                            Image(image)
                                .resizable()
                                .frame(width: 45, height: 50)
                        }
                        .frame(width: 72, height: 72)
                        .background(Color.buttonShape)
                        .cornerRadius(12)
                        .padding(.leading, 16)
                        
                        VStack(spacing: 0) {
                            VStack(spacing: 6) {
                                Text(title)
                                    .font(Font.custom("Switzer-Semibold", size: 16))
                                    .foregroundStyle(Color.textClr)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text(subtitle)
                                    .font(Font.custom("Switzer-Regular", size: 13))
                                    .foregroundStyle(Color.subTextClr)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            
                            Text(price.formatted(.currency(code: "USD")))
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
                    .background(.blue)
//                }
//                .frame(maxWidth: .infinity, maxHeight: 104)
                .background(.red)
            }
            
            .background(.green)
        }
        .frame(maxWidth: .infinity, maxHeight: 104)
        .cornerRadius(14)
        .padding(.vertical, 24)
    }
}

#Preview {
    AddToCartView()
//        .environmentObject(CartManager())
}
