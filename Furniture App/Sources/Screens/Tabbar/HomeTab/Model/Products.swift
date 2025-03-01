//
//  Products.swift
//  Furniture App
//
//  Created by Owais on 1/29/25.
//

import Foundation

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
    
    init(id: UUID = UUID(), productImage: String, productTitle: String, productSubTitle: String, productPrice: Double, productDescription: String, rating: Double, quantity: Int = 0) {
        self.id = id
        self.productImage = productImage
        self.productTitle = productTitle
        self.productSubTitle = productSubTitle
        self.productPrice = productPrice
        self.productDescription = productDescription
        self.rating = rating
        self.quantity = quantity
    }
}

var productsDataArray: [Products] = [
    Products(productImage: "productImage", productTitle: "Ox Mathis Chair", productSubTitle: "Hans j. wegner", productPrice: 9.99, productDescription: "The Swedish Designer Monica Forstar’s Style Is Characterised By her Enternal love For New Materials and Beautiful Pure Shapes.", rating: 4.5, quantity: 40),
    
    Products(productImage: "sofa5", productTitle: "Fuji Arm Chair", productSubTitle: "Hans j. wegner", productPrice: 19.20, productDescription: "The Swedish Designer Monica Forstar’s Style Is Characterised By her Enternal love For New Materials and Beautiful Pure Shapes.", rating: 2, quantity: 10),
    
    Products(productImage: "productImage", productTitle: "Ox Mathis Chair", productSubTitle: "Hans j. wegner", productPrice: 10.40, productDescription: "The Swedish Designer Monica Forstar’s Style Is Characterised By her Enternal love For New Materials and Beautiful Pure Shapes.", rating: 1, quantity: 0),
    
    Products(productImage: "sofa5", productTitle: "Fuji Arm Chair", productSubTitle: "Hans j. wegner", productPrice: 17.70, productDescription: "The Swedish Designer Monica Forstar’s Style Is Characterised By her Enternal love For New Materials and Beautiful Pure Shapes.", rating: 3, quantity: 10)
]
