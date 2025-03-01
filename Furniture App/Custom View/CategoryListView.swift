//
//  CategoryListView.swift
//  Furniture App
//
//  Created by Owais on 1/29/25.
//

import SwiftUI

struct CategoryListView: View {
    @State private var selectedCategory: String = "Armchair"
    
    let categories: [(name: String, image: String)] = [
        ("Armchair", "armchair"),
        ("Bed", "bed"),
        ("Light", "light"),
        ("Sofa", "sofa-c")
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(categories, id: \.name) { category in
                    Button {
                        selectedCategory = category.name
                        selectedCategory = category.image
                    } label: {
                        HStack {
                            Image(category.image)
                                .resizable()
                                .renderingMode(.template)
                                .frame(width: 20, height: 20)
                            Text(category.name)
                                .font(Font.custom("Switzer-Regular", size: 13))
                        }
                        .frame(height: 32)
                        .foregroundStyle(selectedCategory == category.name ? .white : .subTextClr)
                        .padding(.horizontal, 16)
                        .background(selectedCategory == category.name ? Color("primaryColor") : .white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.gray.opacity(0.3), lineWidth: selectedCategory == category.name ? 0 : 1)
                        )
                    }
                }
            }
            .padding(.horizontal, 24)
        }
    }
}

#Preview {
    CategoryListView()
}
