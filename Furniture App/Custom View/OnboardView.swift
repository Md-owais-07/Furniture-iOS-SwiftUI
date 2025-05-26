//
//  OnboardView.swift
//  Furniture App
//
//  Created by Owais on 1/26/25.
//

import SwiftUI

struct OnboardView: View {
    let imageName: String
    let title: String
    
    var body: some View {
        VStack(spacing: 30) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .clipShape(.circle)
                .padding(.top, -30)
            
            Text(title)
                .frame(height: 96)
                .padding(.top, 0)
                .foregroundStyle(Color("textClr"))
                .font(.system(size: 24, weight: .medium, design: .default))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 50)
        }
    }
}

#Preview {
    OnboardView(imageName: "on-1", title: "Demo")
}
