//
//  ProductQuantityButton.swift
//  Furniture App
//
//  Created by Owais on 2/26/25.
//

import SwiftUI

struct ProductQuantityButton: View {

    @EnvironmentObject var cartVM: FinalCartManager

    let product: Products

    var body: some View {

        let quantity = cartVM.quantity(for: product)

        if quantity > 0 {

            HStack {

                Button {
                    cartVM.removeFromCart(product)
                } label: {
                    Image(systemName: "minus")
                }

                Text("\(quantity)")

                Button {
                    cartVM.addToCart(product)
                } label: {
                    Image(systemName: "plus")
                }
            }

        } else {

            Button("Add") {
                cartVM.addToCart(product)
            }
        }
    }
}

#Preview {
    ProductQuantityButton(product: .mock)
}
