//
//  AddToCartView.swift
//  Furniture App
//
//  Created by Owais on 2/26/25.
//

import SwiftUI

struct AddToCartView: View {
    @State private var quantity: Int = 1
    
    var image: String = ""
    var title: String = ""
    var subtitle: String = ""
    var price: Double = 0.0
    
    var body: some View {
        ZStack {
            Color.white
            
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
                    
//                    Text(price)
                    Text("$\(price, specifier: "%.2f")")
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
        }
        .cornerRadius(14)
    }
}

#Preview {
    AddToCartView()
}
