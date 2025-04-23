//
//  BottomButtonView.swift
//  Furniture App
//
//  Created by Owais on 2/20/25.
//

import SwiftUI

struct BottomButtonView: View {
    var price: String = "100"
    @State private var quantity: Int = 0
    
    var body: some View {
        
        VStack() {
            Spacer()
            VStack(spacing: 0) {
                HStack(spacing: 10) {
                    
                    ProductQuantityButton(quantity: $quantity)
                    
                    Spacer()
                    
                    Text("Total: \(price)")
                }
                .frame(height: 26)
                .padding(.bottom, 24)
                
                CustomButtonView(action: {
                    //
                }, title: "Add To Cart", isImageVisible: true, imageName: "adt", bgColor: Color("primaryColor"), textColor: .white)
            }
            .padding(.horizontal, 24)
            .padding(.top, 24)
            .padding(.bottom, 20)
            .background(.white)
            .clipShape(RoundedCorner(radius: 24, corners: [.topLeft, .topRight]))
        }
    }
}

#Preview {
    BottomButtonView()
        .previewLayout(.sizeThatFits)
}
