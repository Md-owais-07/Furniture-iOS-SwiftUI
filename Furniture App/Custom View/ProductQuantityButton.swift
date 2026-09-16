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
                        .font(.system(size: 15, weight: .medium))
                        .foregroundStyle(Color("subTextClr"))
                        .frame(width: 26, height: 26)
                        .background(Color("buttonShapeColor"))
                        .clipShape(Circle())
                }
                
                Text("\(quantity)")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundStyle(.black)
                
                Button {
                    cartVM.addToCart(product)
                } label: {
                    Image(systemName: "plus")
                        .font(.system(size: 15, weight: .medium))
                        .foregroundStyle(.white)
                        .frame(width: 26, height: 26)
                        .background(Color("primaryColor"))
                        .clipShape(Circle())
                }
            }
        }
    }
}

#Preview {
    ProductQuantityButton(product: .mock)
        .environmentObject(FinalCartManager())
}
