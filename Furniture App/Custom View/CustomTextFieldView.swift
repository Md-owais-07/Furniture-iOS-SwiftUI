//
//  CustomTextFieldView.swift
//  Furniture App
//
//  Created by Owais on 1/27/25.
//

import SwiftUI

struct CustomTextFieldView: View {
    var title: String
    var placeholder: String
    @Binding var text: String
    var isSecure: Bool = false

    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Text(title)
                    .font(.system(size: 14, weight: .medium, design: .default))
                    .foregroundStyle(.secondary) // Updated for better clarity
                
                Spacer()
            }
            
            VStack {
                if isSecure {
                    SecureField(placeholder, text: $text)
                        .multilineTextAlignment(.leading) // Ensures placeholder aligns left
                        .frame(height: 44)
                        .padding(.horizontal, 12) // Padding inside the text field
                        .cornerRadius(12)
                } else {
                    TextField(placeholder, text: $text)
                        .multilineTextAlignment(.leading) // Ensures placeholder aligns left
                        .frame(height: 44)
                        .padding(.horizontal, 12) // Padding inside the text field
                        .cornerRadius(12)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 44)
            .background(Color.white)
            .cornerRadius(12)
        }
    }
}

#Preview {
    CustomTextFieldView(title: "Demo", placeholder: "Placeholder", text: .constant(""))
}

