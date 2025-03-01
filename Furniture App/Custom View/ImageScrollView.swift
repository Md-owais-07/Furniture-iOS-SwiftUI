//
//  ImageScrollView.swift
//  Furniture App
//
//  Created by Owais on 1/29/25.
//

import SwiftUI

struct ImageScrollView: View {
    let items = [
        ("25% Discount", "For a cozy yellow set!", "Learn More"),
        ("35% Discount", "For a cozy blue set!", "Shop Now"),
        ("40% Off", "Limited time offer!", "Grab Deal")
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: -12) {
                    ForEach(items, id: \.0) { item in
                        DiscountcardView(title: item.0, subTitle: item.1, buttonTitle: item.2, imageName: "sofa1")
                    }
                }
            }
            HStack(spacing: 6) {
                Circle().frame(width: 8, height: 8).foregroundColor(.green)
                Circle().frame(width: 8, height: 8).foregroundColor(.gray.opacity(0.5))
                Circle().frame(width: 8, height: 8).foregroundColor(.gray.opacity(0.5))
            }
            .padding(.top, 8)
        }
    }
}


#Preview {
    ImageScrollView()
}
