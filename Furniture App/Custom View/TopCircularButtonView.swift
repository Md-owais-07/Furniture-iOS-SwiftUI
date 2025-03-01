//
//  BackButtonView.swift
//  Furniture App
//
//  Created by Owais on 1/27/25.
//

import SwiftUI

struct TopCircularButtonView: View {
    var action: () -> Void
    var imageName: String
    
    var body: some View {
        
        Button(action: action) {
            Image(imageName)
                .scaledToFit()
                .frame(width: 48, height: 48)
                .foregroundColor(.white)
                .background(Color.white)
                .clipShape(Circle())
        }
    }
}

#Preview {
    TopCircularButtonView(action: {
        print("Demo")
    }, imageName: "backBtn")
}
