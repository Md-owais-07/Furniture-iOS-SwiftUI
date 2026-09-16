//
//  ProductCardSkeletonView.swift
//  Furniture App
//
//  Created by Owais on 6/12/26.
//

import SwiftUI

struct ProductCardSkeletonView: View {

    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.buttonShape)
                .frame(width: 120, height: 120)

            RoundedRectangle(cornerRadius: 6)
                .fill(Color.buttonShape)
                .frame(height: 18)

            RoundedRectangle(cornerRadius: 6)
                .fill(Color.buttonShape)
                .frame(height: 14)

            Spacer()
        }
        .padding()
        .frame(width: 190, height: 250)
        .background(Color.white)
        .cornerRadius(14)
        .redacted(reason: .placeholder)
    }
}

#Preview {
    ProductCardSkeletonView()
}
