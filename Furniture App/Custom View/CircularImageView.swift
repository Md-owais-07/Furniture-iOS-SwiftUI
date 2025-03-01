//
//  CircularImageView.swift
//  Furniture App
//
//  Created by Owais on 1/27/25.
//

import SwiftUI

struct CircularImageView: View {
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .clipShape(.circle)
            .frame(width: 48, height: 48)
    }
}

#Preview {
    CircularImageView(imageName: "Google")
}
