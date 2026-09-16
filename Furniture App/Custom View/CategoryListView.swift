//
//  CategoryListView.swift
//  Furniture App
//
//  Created by Owais on 1/29/25.
//

import SwiftUI
import Shimmer

struct CategoryListView: View {
    @State private var selectedCategory: String = "Bed"
    
    @EnvironmentObject var productVM: ProductViewModel
    @EnvironmentObject var categoryVM: CategoryViewModel
    
    @EnvironmentObject var navManager: AppNavigationManager
    
    @State private var isAddedToCart: Bool = false
    @State private var quantity: Int = 0
    
    var filteredProducts: [Products] {
        productVM.products.filter { $0.category == selectedCategory }
    }
    
    var body: some View {
        VStack(spacing: 16) {
            // **Category Selector**
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(categoryVM.categories) { category in
                        Button {
                            withAnimation {
                                selectedCategory = category.name
                            }
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
                            .foregroundColor(selectedCategory == category.name ? .white : .gray)
                            .padding(.horizontal, 16)
                            .background(selectedCategory == category.name ? Color("primaryColor") : Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 0)
            }
            
            HStack {
                Text("Most Interested")
                    .font(Font.custom("Switzer-Semibold", size: 16))
                    .foregroundStyle(Color.textClr)
                
                Spacer()
                
                NavigationLink {
                    MostCategoryView(title: "Most Interested")
                } label: {
                    Text("View All")
                        .font(Font.custom("Switzer-Regular", size: 13))
                        .foregroundStyle(Color.primaryButton)
                }
            }
            .frame(height: 24)
            .padding(.horizontal, 24)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    if productVM.isLoading {
                        ForEach(0..<3, id: \.self) { _ in
                            ProductCardSkeletonView()
                                .shimmering()
                        }
                    } else {
                        ForEach(filteredProducts) { product in
                            NavigationLink(destination: ProductDetailView(product: product)) {
                                ProductCardView(product: product)
                            }
                        }
                    }
                }
                .padding(.horizontal, 24)
            }
        }
        .background(Color("AppColor").ignoresSafeArea(.all))
        .onAppear {
            if selectedCategory.isEmpty,
               let firstCategory = categoryVM.categories.first {
                selectedCategory = firstCategory.name
            }
        }
        .onChange(of: categoryVM.categories.count, { _, _ in
            if selectedCategory.isEmpty,
               let firstCategory = categoryVM.categories.first {
                selectedCategory = firstCategory.name
            }
        })
    }
}

#Preview {
    CategoryListView()
}
