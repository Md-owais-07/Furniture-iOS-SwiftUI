//
//  ProductDetailView2.swift
//  Furniture App
//
//  Created by Owais on 5/26/25.
//

import SwiftUI

struct ProductDetailView2: View {
    var product: Products

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Image(product.productImage)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(12)

                Text(product.productTitle)
                    .font(.title)
                    .fontWeight(.bold)

                Text(product.productSubTitle)
                    .font(.subheadline)
                    .foregroundColor(.gray)

                Text(String(format: "$%.2f", product.productPrice))
                    .font(.headline)
                    .foregroundColor(.blue)

                Text(product.productDescription)
                    .font(.body)
                    .padding(.top, 8)

                // Add quantity or add-to-cart logic here if needed
            }
            .padding()
        }
        .navigationTitle("Product Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    ProductDetailView2(product: productsDataArray[0])
}
