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
        VStack(spacing: 0) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .clipShape(.circle)
                .padding(.top, -120)
            
            Text(title)
                .frame(height: 96)
                .padding(.top, -65)
                .foregroundStyle(Color("textClr"))
                .font(.system(size: 24, weight: .medium, design: .default))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 50)
        }
    }
}

#Preview {
    OnboardView(imageName: "Sofa", title: "Demo")
}
