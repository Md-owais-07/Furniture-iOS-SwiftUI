//
//  Products.swift
//  Furniture App
//
//  Created by Owais on 1/29/25.
//

import Foundation

// MARK: - Category Model
struct Category: Identifiable {
    let id = UUID()
    let name: String
    let image: String
}

// MARK: - Product Model
struct Products: Identifiable {
    let id: UUID
    let productImage: String
    let productTitle: String
    let productSubTitle: String
    let productPrice: Double
    let productDescription: String
    let rating: Double
    let maxStars = 5
    var quantity: Int
    let category: String
    
    init(id: UUID = UUID(), productImage: String, productTitle: String, productSubTitle: String, productPrice: Double, productDescription: String, rating: Double, quantity: Int = 0, category: String) {
        self.id = id
        self.productImage = productImage
        self.productTitle = productTitle
        self.productSubTitle = productSubTitle
        self.productPrice = productPrice
        self.productDescription = productDescription
        self.rating = rating
        self.quantity = quantity
        self.category = category
    }
}

// MARK: - Sample Data
let categories: [Category] = [
    Category(name: "Chair", image: "armchair"),
    Category(name: "Sofa", image: "sofa-c"),
    Category(name: "Bed", image: "bed"),
    Category(name: "Light", image: "light"),
]

var productsDataArray: [Products] = [
    Products(productImage: "productImage", productTitle: "Ox Mathis Chair", productSubTitle: "Hans j. wegner", productPrice: 9.99, productDescription: "The Swedish Designer Monica Forstar’s Style Is Characterised By her Enternal love For New Materials and Beautiful Pure Shapes.", rating: 4.5, quantity: 40, category: "Chair"),
    
    Products(productImage: "Bed2", productTitle: "Fuji Arm Chair", productSubTitle: "Hans j. wegner", productPrice: 19.20, productDescription: "The Swedish Designer Monica Forstar’s Style Is Characterised By her Enternal love For New Materials and Beautiful Pure Shapes.", rating: 2, quantity: 10, category: "Bed"),
    
    Products(productImage: "sofa5", productTitle: "Ox Mathis Chair", productSubTitle: "Hans j. wegner", productPrice: 10.40, productDescription: "The Swedish Designer Monica Forstar’s Style Is Characterised By her Enternal love For New Materials and Beautiful Pure Shapes.", rating: 1, quantity: 0, category: "Sofa"),
    
    Products(productImage: "Light2", productTitle: "Fuji Arm Chair", productSubTitle: "Hans j. wegner", productPrice: 17.70, productDescription: "The Swedish Designer Monica Forstar’s Style Is Characterised By her Enternal love For New Materials and Beautiful Pure Shapes.", rating: 3, quantity: 10, category: "Light"),
    Products(productImage: "Light", productTitle: "Fuji Arm Chair", productSubTitle: "Hans j. wegner", productPrice: 17.70, productDescription: "The Swedish Designer Monica Forstar’s Style Is Characterised By her Enternal love For New Materials and Beautiful Pure Shapes.", rating: 3, quantity: 10, category: "Light"),
    Products(productImage: "Light2", productTitle: "Fuji Arm Chair", productSubTitle: "Hans j. wegner", productPrice: 17.70, productDescription: "The Swedish Designer Monica Forstar’s Style Is Characterised By her Enternal love For New Materials and Beautiful Pure Shapes.", rating: 3, quantity: 10, category: "Light"),
    Products(productImage: "Light", productTitle: "Fuji Arm Chair", productSubTitle: "Hans j. wegner", productPrice: 17.70, productDescription: "The Swedish Designer Monica Forstar’s Style Is Characterised By her Enternal love For New Materials and Beautiful Pure Shapes.", rating: 3, quantity: 10, category: "Light")
]
