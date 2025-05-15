//
//  HeaderView.swift
//  Furniture App
//
//  Created by Owais on 5/9/25.
//

import SwiftUI

struct HeaderView: View {
    var action: () -> Void = {}
    let title: String
    @EnvironmentObject var navManager: AppNavigationManager
    
    var body: some View {
        ZStack {
            HStack {
                TopCircularButtonView(action: {
                    navManager.pop()
                }, imageName: "backBtn")
                
                Spacer()
            }
            
            ZStack {
                Text(title)
                    .font(Font.custom("Switzer-Medium", size: 20))
                    .foregroundStyle(Color.textClr)
            }
        }
        .padding(.horizontal, 24)
    }
}

#Preview {
    HeaderView(title: "demo")
}

