//
//  CategoryListView.swift
//  Furniture App
//
//  Created by Owais on 1/29/25.
//

//import SwiftUI
//
//struct CategoryListView: View {
//    @State private var selectedCategory: String = "Armchair"
//    
//    let categories: [(name: String, image: String)] = [
//        ("Armchair", "armchair"),
//        ("Bed", "bed"),
//        ("Light", "light"),
//        ("Sofa", "sofa-c")
//    ]
//    
//    var body: some View {
//        ScrollView(.horizontal, showsIndicators: false) {
//            HStack(spacing: 12) {
//                ForEach(categories, id: \.name) { category in
//                    Button {
//                        selectedCategory = category.name
//                        selectedCategory = category.image
//                    } label: {
//                        HStack {
//                            Image(category.image)
//                                .resizable()
//                                .renderingMode(.template)
//                                .frame(width: 20, height: 20)
//                            Text(category.name)
//                                .font(Font.custom("Switzer-Regular", size: 13))
//                        }
//                        .frame(height: 32)
//                        .foregroundStyle(selectedCategory == category.name ? .white : .subTextClr)
//                        .padding(.horizontal, 16)
//                        .background(selectedCategory == category.name ? Color("primaryColor") : .white)
//                        .clipShape(RoundedRectangle(cornerRadius: 10))
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 20)
//                                .stroke(Color.gray.opacity(0.3), lineWidth: selectedCategory == category.name ? 0 : 1)
//                        )
//                    }
//                }
//            }
//            .padding(.horizontal, 24)
//        }
//    }
//}
//
//#Preview {
//    CategoryListView()
//}




//import SwiftUI
//
//struct CategoryListView: View {
//    @State private var selectedCategory: String = "Armchair"
//
//    let categories: [(name: String, image: String)] = [
//        ("Armchair", "armchair"),
//        ("Bed", "bed"),
//        ("Light", "light"),
//        ("Sofa", "sofa-c")
//    ]
//
//    var body: some View {
//        ScrollView(.horizontal, showsIndicators: false) {
//            HStack(spacing: 12) {
//                ForEach(categories, id: \.name) { category in
//                    Button {
//                        withAnimation {
//                            selectedCategory = category.name
//                        }
//                    } label: {
//                        HStack {
//                            Image(category.image)
//                                .resizable()
//                                .renderingMode(.template)
//                                .frame(width: 20, height: 20)
//                            
//                            Text(category.name)
//                                .font(Font.custom("Switzer-Regular", size: 13))
//                        }
//                        .frame(height: 32)
//                        .foregroundColor(selectedCategory == category.name ? .white : Color("subTextClr"))
//                        .padding(.horizontal, 16)
//                        .background(selectedCategory == category.name ? Color("primaryColor") : Color.white)
//                        .clipShape(RoundedRectangle(cornerRadius: 10))
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 10)
//                                .stroke(Color.gray.opacity(0.3), lineWidth: selectedCategory == category.name ? 0 : 1)
//                        )
//                    }
//                }
//            }
//            .padding(.horizontal, 24)
//        }
//    }
//}
//
//#Preview {
//    CategoryListView()
//}




import SwiftUI

//// MARK: - Category Model
//struct Category: Identifiable {
//    let id = UUID()
//    let name: String
//    let image: String
//}
//
//// MARK: - Product Model
//struct Product: Identifiable {
//    let id = UUID()
//    let name: String
//    let image: String
//    let price: Double
//    let category: String
//}
//
//// MARK: - Sample Data
//let categories: [Category] = [
//    Category(name: "Chair", image: "armchair"),
//    Category(name: "Sofa", image: "sofa-c"),
//    Category(name: "Bed", image: "bed"),
//    Category(name: "Light", image: "light"),
//]
//
//let productsData: [Product] = [
//    Product(name: "Modern Chair", image: "chair1", price: 199.99, category: "Chair"),
//    Product(name: "Elegant Armchair", image: "chair2", price: 229.99, category: "Chair"),
//    Product(name: "Luxury Sofa", image: "sofa1", price: 799.99, category: "Sofa"),
//    Product(name: "Cozy Sofa Set", image: "sofa2", price: 899.99, category: "Sofa"),
//    Product(name: "King Size Bed", image: "bed1", price: 999.99, category: "Bed"),
//    Product(name: "Minimalist Bed", image: "bed2", price: 899.99, category: "Bed"),
//    Product(name: "Stylish Lamp", image: "light1", price: 79.99, category: "Light"),
//    Product(name: "Luxury Table Lamp", image: "light2", price: 129.99, category: "Light")
//]

// MARK: - Category & Product List View
struct CategoryListView: View {
    @State private var selectedCategory: String = "Chair"
    
    var product: Products
    
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var navManager: AppNavigationManager
    
    @State private var isAddedToCart: Bool = false
    @State private var quantity: Int = 0
    @ObservedObject var manager = CartManager()
    
    var filteredProducts: [Products] {
        productsDataArray.filter { $0.category == selectedCategory }
    }

    var body: some View {
        VStack(spacing: 16) {
            // **Category Selector**
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(categories) { category in
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
//                .padding(.horizontal, 24)
                .padding(.bottom, 0)
            }
            
            HStack {
                Text("Most Interested")
                    .font(Font.custom("Switzer-Semibold", size: 16))
                    .foregroundStyle(Color.textClr)
                
                Spacer()
                
                NavigationLink {
                    MostCategoryView()
                } label: {
                    Text("View All")
                        .font(Font.custom("Switzer-Regular", size: 13))
                        .foregroundStyle(Color.primaryButton)
                }
            }
            .frame(height: 24)
//            .padding(.horizontal, 24)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: -8) {
                    ForEach(filteredProducts) { product in
                        NavigationLink(destination: ProductDetailView(product: product)) {
                            ProductCardView(product: product)
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 24)
    }
}

#Preview {
    CategoryListView(product: productsDataArray[0])
}
