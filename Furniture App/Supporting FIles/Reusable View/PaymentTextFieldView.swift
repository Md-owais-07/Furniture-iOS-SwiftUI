//
//  PaymentTextFieldView.swift
//  Furniture App
//
//  Created by Owais on 4/28/25.
//

import SwiftUI

struct PaymentTextFieldView: View {
    var title: String
    var placeholder: String
    @Binding var text: String
    @Binding var isValid: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 5) {
                Text("\(title)")
                    .font(Font.custom("Switzer-Medium", size: 15))
                    .foregroundStyle(Color.textClr)
                
                Text("*")
                    .fontWeight(.medium)
                    .foregroundStyle(Color.red)
            }
            
            VStack {
                TextField("\(placeholder)", text: $text)
                    .frame(height: 42)
                    .padding(.horizontal, 16)
                    .cornerRadius(8)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(isValid ? Color.gray.opacity(0.8) : Color.red, lineWidth: 0.5)
                    }
            }.background(.white)
        }
    }
}

#Preview {
    PaymentTextFieldView(title: "Title", placeholder: "  ----  ----  ----  ----", text: .constant(""), isValid: .constant(true))
}
