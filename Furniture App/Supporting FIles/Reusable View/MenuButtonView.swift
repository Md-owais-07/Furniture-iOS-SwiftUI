//
//  MenuButtonView.swift
//  Furniture App
//
//  Created by Owais on 4/3/25.
//

import SwiftUI

struct MenuButtonView: View {
    let item: MenuItem
    
    var body: some View {
        Button(action: item.action) {
            HStack(spacing: 12) {
                Image(item.imageName)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .padding(.vertical, 16)
                    .padding(.leading, 16)
                
                Text(item.title)
                    .font(Font.custom("Switzer-Medium", size: 16))
                    .foregroundStyle(Color.textClr)
            }
            .frame(maxWidth: .infinity, maxHeight: 56, alignment: .leading)
            .background(Color.white)
            .cornerRadius(14)
        }
    }
}

#Preview {
    MenuButtonView(item: MenuItem(title: "dmeo", imageName: "demo", action: {
        //
    }))
}
