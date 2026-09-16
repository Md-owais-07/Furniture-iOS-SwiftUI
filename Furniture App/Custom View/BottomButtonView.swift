//
//  BottomButtonView.swift
//  Furniture App
//
//  Created by Owais on 2/20/25.
//

import SwiftUI

struct BottomButtonView: View {
    var price: String = "100"
    let product: Products
    
    @EnvironmentObject var cartManager: FinalCartManager
    
    var body: some View {
        
        VStack {
            Spacer()
            VStack(spacing: 0) {
                HStack(spacing: 10) {
                    ProductQuantityButton(product: product)
                    
                    Spacer()
                    
                    Text("Total: \(price)")
                }
                .frame(height: 26)
                .padding(.bottom, 24)
                
                CustomButtonView(action: {
                    cartManager.addToCart(product)
                }, title: "Add To Cart", isImageVisible: true, imageName: "adt", bgColor: Color("primaryColor"), textColor: .white)
            }
            .padding(.horizontal, 24)
            .padding(.top, 24)
            .padding(.bottom, 85)
            .background(.white)
            .clipShape(RoundedCorner(radius: 24, corners: [.topLeft, .topRight]))
        }
    }
}

#Preview {
    BottomButtonView(product: .mock)
        .environmentObject(FinalCartManager())
}
