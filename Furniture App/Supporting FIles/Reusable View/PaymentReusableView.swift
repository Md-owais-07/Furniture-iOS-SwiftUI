//
//  PaymentView.swift
//  Furniture App
//
//  Created by Owais on 4/21/25.
//

import SwiftUI

struct PaymentReusableView: View {
    var action: () -> Void
    var image: String = ""
    var title: String = ""
    var toggleImage: String = ""
    
    var body: some View {
        HStack {
            HStack(spacing: 16) {
                ZStack {
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 25, maxHeight: 25)
                    
                }
                .frame(width: 44, height: 44)
                .background(Color.buttonShape)
                .cornerRadius(14)
                
                Text(title)
                    .font(Font.custom("Switzer-Medium", size: 16))
                    .foregroundStyle(Color.textClr)
            }
            
            Spacer()
            
            Button(action: action) {
                Image(toggleImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 44)
    }
}

#Preview {
    PaymentReusableView(action: {
        print("hi")
    })
}
