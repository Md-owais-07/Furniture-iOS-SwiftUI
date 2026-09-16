//
//  CustomButtonView.swift
//  Furniture App
//
//  Created by Owais on 1/27/25.
//

import SwiftUI

struct CustomButtonView: View {
    var action: () -> Void
    var title: String
    var isImageVisible: Bool = false
    var imageName: String = "Google"
    var bgColor: Color = Color("primaryColor")
    var textColor: Color = .white
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 10) {
                if isImageVisible {
                    Image(imageName)
                        .resizable()
                        .frame(width: 24, height: 24)
                    
                    Text(title)
                        .font(.system(size: 16, weight: .semibold, design: .default))
                        .foregroundStyle(textColor)
                } else {
                    Text(title)
                        .font(.system(size: 16, weight: .semibold, design: .default))
                        .foregroundStyle(textColor)
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 56)
            .background(Color(bgColor))
            .cornerRadius(14)
        }
    }
}

#Preview {
    CustomButtonView(action: {
        //
    }, title: "demo")
}
