//
//  ProductQuantityButton.swift
//  Furniture App
//
//  Created by Owais on 2/26/25.
//

import SwiftUI

struct ProductQuantityButton: View {
    @Binding var quantity: Int
    
    var body: some View {
        VStack {
            HStack(spacing: 8) {
                Button {
                    if quantity > 0 {
                        quantity -= 1
                    }
                } label: {
                    Image(systemName: "minus")
                        .scaledToFit()
                        .frame(width: 26, height: 26)
                        .foregroundColor(Color("subTextClr"))
                        .background(Color("buttonShapeColor"))
                        .clipShape(Circle())
                }
                
                Text("\(quantity)")
                    .font(Font.custom("Switzer-Regular", size: 14))
                    .foregroundStyle(Color.textClr)
                
                Button {
                    quantity += 1
                } label: {
                    Image(systemName: "plus")
                        .scaledToFit()
                        .frame(width: 26, height: 26)
                        .foregroundColor(Color.white)
                        .background(Color("primaryColor"))
                        .clipShape(Circle())
                }
            }
        }
    }
}

#Preview {
    ProductQuantityButton(quantity: .constant(1))
}
