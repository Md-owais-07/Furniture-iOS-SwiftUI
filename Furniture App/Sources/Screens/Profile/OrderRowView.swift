//
//  OrderRowView.swift
//  Furniture App
//
//  Created by Owais on 6/11/26.
//

import SwiftUI

struct OrderRowView: View {

    let order: Order

    var body: some View {

        VStack(alignment: .leading, spacing: 12) {

            HStack {

                Text("Order")
                    .font(.headline)

                Spacer()

                Text(
                    order.orderDate,
                    style: .date
                )
                .font(.caption)
            }

            ForEach(order.items) { item in

                HStack(spacing: 12) {
                    LoadserverImageView(urlString: item.product.productImage)
                        .frame(width: 60, height: 60)

                    VStack(alignment: .leading, spacing: 4) {

                        Text(item.product.productTitle)
                            .font(.headline)

                        Text(item.product.productSubTitle)
                            .font(.caption)
                            .foregroundColor(.secondary)

                        Text("Qty: \(item.quantity)")
                            .font(.caption)
                    }

                    Spacer()

                    Text(
                        "$\((item.product.productPrice * Double(item.quantity)), specifier: "%.2f")"
                    )
                    .font(.subheadline)
                    .foregroundColor(.primaryButton)
                }
            }

            Divider()

            HStack {

                Text("Total")

                Spacer()

                Text("$\(order.totalAmount, specifier: "%.2f")")
                    .fontWeight(.semibold)
                    .foregroundColor(.primaryButton)
            }
        }
        .padding()
        .background(.white)
        .cornerRadius(16)
    }
}

#Preview {

    OrderRowView(
        order: Order(
            orderDate: Date(),
            totalAmount: 24.50,
            items: [
                CartItem(
                    product: .mock,
                    quantity: 1
                )
            ]
        )
    )
}
