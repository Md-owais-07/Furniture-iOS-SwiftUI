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
    
    @State private var currentPage = 0
    private let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $currentPage) {
                ForEach(0..<items.count, id: \.self) { index in
                    DiscountcardView(
                        title: items[index].0,
                        subTitle: items[index].1,
                        buttonTitle: items[index].2,
                        imageName: "sofa1"
                    )
                    .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // Hides default page dots
            .frame(height: 150)
            .onReceive(timer) { _ in
                withAnimation {
                    currentPage = (currentPage + 1) % items.count
                }
            }
            
            // Custom Page Control
            HStack(spacing: 6) {
                ForEach(0..<items.count, id: \.self) { index in
                    Circle()
                        .frame(width: 8, height: 8)
                        .foregroundColor(currentPage == index ? .green : .gray.opacity(0.5))
                }
            }
            .padding(.top, 8)
        }
    }
}

#Preview {
    ImageScrollView()
}

