//
//  PaymentView.swift
//  Furniture App
//
//  Created by Owais on 4/21/25.
//

import SwiftUI

struct PaymentReusableView: View {
    let data: CheckoutModel
    let isSelected: Bool
    let isLastItem: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                HStack(spacing: 16) {
                    Image(data.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .frame(width: 44, height: 44)
                        .background(
                            RoundedRectangle(cornerRadius: 14)
                                .fill(Color.buttonShape)
                        )
                    
                    Text(data.title)
                        .font(Font.custom("Switzer-Medium", size: 16))
                        .foregroundStyle(Color.textClr)
                }
                
                Spacer()
                
                if isLastItem {
                    Image(systemName: "chevron.right")
                        .font(.system(size: 18, weight: .medium))
                } else {
                    Image(isSelected ? "check" : "uncheck")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 60)
            .background(Color("AppColor"))
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    PaymentReusableView(data: checkoutData[0], isSelected: true, isLastItem: true, action: {})
}
