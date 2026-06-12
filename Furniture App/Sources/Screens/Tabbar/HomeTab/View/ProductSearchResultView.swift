//
//  ProductSearchResultView.swift
//  Furniture App
//
//  Created by Owais on 5/26/25.
//

import SwiftUI

struct ProductSearchResultView: View {
    let product: Products
    
    var body: some View {
        ZStack {
            Color("AppColor")
            
            VStack {
                NavigationLink {
                    ProductDetailView(product: product)
                } label: {
                    Text(product.productTitle)
                        .foregroundStyle(.black)
                        .padding(.vertical, 8)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .cornerRadius(8)
                }
            }
            .padding(.horizontal)
        }
    }
}


#Preview {
    ProductSearchResultView(product: .mock)
        .environmentObject(FinalCartManager())
}
