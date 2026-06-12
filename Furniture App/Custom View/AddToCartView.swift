//
//  AddToCartView.swift
//  Furniture App
//
//  Created by Owais on 2/26/25.
//

import SwiftUI

struct AddToCartView: View {

    let item: CartItem
    @EnvironmentObject var productVM: ProductViewModel

    var body: some View {

        ZStack {

            Color.white

            HStack(spacing: 0) {

                ZStack {
                    LoadserverImageView(urlString: item.product.productImage)
                        .frame(width: 45, height: 50)
//                    Image(item.product.productImage)
//                        .resizable()
//                        .scaledToFit()
                }
                .frame(width: 72, height: 72)
                .background(Color.buttonShape)
                .cornerRadius(12)
                .padding(.leading, 16)

                VStack(spacing: 0) {

                    VStack(spacing: 6) {

                        Text(item.product.productTitle)
                            .font(Font.custom("Switzer-Semibold", size: 16))
                            .foregroundStyle(Color.textClr)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        Text(item.product.productSubTitle)
                            .font(Font.custom("Switzer-Regular", size: 13))
                            .foregroundStyle(Color.subTextClr)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }

                    Text("$\(item.product.productPrice, specifier: "%.2f")")
                        .font(Font.custom("Switzer-Medium", size: 16))
                        .foregroundStyle(Color.primaryButton)
                        .padding(.top, 12)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.top, 4)
                .padding(.leading, 12)

                Spacer()

                ProductQuantityButton(
                    product: item.product
                )
                .padding(.trailing, 16)
            }
            .frame(height: 104)
        }
        .background(.white)
        .cornerRadius(14)
    }
}

#Preview {
    AddToCartView(item: CartItem(product: .mock,quantity: 2))
}
