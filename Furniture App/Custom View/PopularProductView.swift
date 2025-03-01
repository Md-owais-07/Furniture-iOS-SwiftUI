//
//  PopularProductView.swift
//  Furniture App
//
//  Created by Owais on 1/29/25.
//

import SwiftUI

struct PopularProductView: View {
    var products: Products
    
    var body: some View {
        ZStack {
            Color.white
            
            ZStack {
                Color.white
                HStack(spacing: 12) {
                    ZStack {
                        Image(products.productImage)
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                    .frame(width: 76, height: 76)
                    .background(Color.buttonShape)
                    .cornerRadius(12)
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text(products.productTitle)
                            .font(Font.custom("Switzer-Semibold", size: 16))
                            .foregroundStyle(.textClr)
                        
                        Text(products.productSubTitle)
                            .font(Font.custom("Switzer-Regular", size: 13))
                            .foregroundStyle(.subTextClr)
                        
                        Spacer()
                        
                        Text(products.productPrice.formatted(.currency(code: "USD")))
                            .font(Font.custom("Switzer-Medium", size: 16))
                            .foregroundStyle(.primaryButton)
                            .padding(.bottom, 2)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
        }
        .frame(width: 226, height: 105)
        .cornerRadius(14)
        .padding(.leading, 24)
    }
}

#Preview {
    PopularProductView(products: productsDataArray[0])
}
