//
//  ProductCardView.swift
//  Furniture App
//
//  Created by Owais on 1/29/25.
//

import SwiftUI

struct ProductCardView: View {

    let product: Products

    @EnvironmentObject var cartManager: FinalCartManager

    var cartQuantity: Int {
        cartManager.quantity(for: product)
    }

    var body: some View {

        ZStack {

            Color.white

            VStack {
                LoadserverImageView(urlString: product.productImage)
                    .frame(maxWidth: 85, maxHeight: 110)
//                Image(product.productImage)
//                    .resizable()
//                    .scaledToFill()
//                    .frame(maxWidth: 85, maxHeight: 110)
//                    .padding(.bottom, 20)

                HStack {

                    VStack(alignment: .leading, spacing: 4) {

                        Text(product.productTitle)
                            .font(Font.custom("Switzer-Semibold", size: 16))
                            .foregroundStyle(.textClr)

                        Text(product.productSubTitle)
                            .font(Font.custom("Switzer-Regular", size: 13))
                            .foregroundStyle(.subTextClr)
                    }

                    Spacer()
                }

                Spacer()

                HStack {

                    Text(
                        product.productPrice.formatted(
                            .currency(code: "USD")
                        )
                    )
                    .font(Font.custom("Switzer-Medium", size: 16))
                    .foregroundStyle(.primaryButton)

                    Spacer()

                    if cartQuantity > 0 {

                        ProductQuantityButton(
                            product: product
                        )

                    } else {

                        Button {

                            cartManager.addToCart(product)

                        } label: {

                            Image("addToCart")
                                .scaledToFit()
                                .frame(width: 32, height: 32)
                                .background(Color("primaryColor"))
                                .clipShape(Circle())
                        }
                    }
                }
            }
            .padding(16)
        }
        .frame(width: 190, height: 250)
        .cornerRadius(14)
    }
}

#Preview {
    ProductCardView(product: .mock)
        .environmentObject(FinalCartManager())
}
