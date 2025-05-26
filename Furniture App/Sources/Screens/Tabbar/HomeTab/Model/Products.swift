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
    Category(name: "Table", image: "light"),
]

//var productsDataArray: [Products] = [
//    Products(productImage: "prd-1", productTitle: "Ox Mathis Chair", productSubTitle: "Hans j. wegner", productPrice: 9.99, productDescription: "The Swedish Designer Monica Forstar’s Style Is Characterised By her Enternal love For New Materials and Beautiful Pure Shapes.", rating: 4.5, quantity: 40, category: "Chair"),
//    Products(productImage: "prd-2", productTitle: "Comfort Chair", productSubTitle: "Hans j. wegner", productPrice: 9.99, productDescription: "The Swedish Designer Monica Forstar’s Style Is Characterised By her Enternal love For New Materials and Beautiful Pure Shapes.", rating: 4.5, quantity: 40, category: "Chair"),
//    Products(productImage: "prd-3", productTitle: "Classic Lounge Chair", productSubTitle: "Hans j. wegner", productPrice: 9.99, productDescription: "The Swedish Designer Monica Forstar’s Style Is Characterised By her Enternal love For New Materials and Beautiful Pure Shapes.", rating: 4.5, quantity: 40, category: "Chair"),
//    Products(productImage: "prd-4", productTitle: "Wooden Armchair", productSubTitle: "Hans j. wegner", productPrice: 9.99, productDescription: "The Swedish Designer Monica Forstar’s Style Is Characterised By her Enternal love For New Materials and Beautiful Pure Shapes.", rating: 4.5, quantity: 40, category: "Chair"),
//
//    
//    Products(productImage: "sf-1", productTitle: "Ox Mathis Chair", productSubTitle: "Hans j. wegner", productPrice: 10.40, productDescription: "The Swedish Designer Monica Forstar’s Style Is Characterised By her Enternal love For New Materials and Beautiful Pure Shapes.", rating: 1, quantity: 0, category: "Sofa"),
//    Products(productImage: "sf-2", productTitle: "Ox Mathis Chair", productSubTitle: "Hans j. wegner", productPrice: 10.40, productDescription: "The Swedish Designer Monica Forstar’s Style Is Characterised By her Enternal love For New Materials and Beautiful Pure Shapes.", rating: 1, quantity: 0, category: "Sofa"),
//    Products(productImage: "sf-3", productTitle: "Ox Mathis Chair", productSubTitle: "Hans j. wegner", productPrice: 10.40, productDescription: "The Swedish Designer Monica Forstar’s Style Is Characterised By her Enternal love For New Materials and Beautiful Pure Shapes.", rating: 1, quantity: 0, category: "Sofa"),
//    Products(productImage: "sf-4", productTitle: "Ox Mathis Chair", productSubTitle: "Hans j. wegner", productPrice: 10.40, productDescription: "The Swedish Designer Monica Forstar’s Style Is Characterised By her Enternal love For New Materials and Beautiful Pure Shapes.", rating: 1, quantity: 0, category: "Sofa"),
//    
//    Products(productImage: "bd-1", productTitle: "Fuji Arm Chair", productSubTitle: "Hans j. wegner", productPrice: 19.20, productDescription: "The Swedish Designer Monica Forstar’s Style Is Characterised By her Enternal love For New Materials and Beautiful Pure Shapes.", rating: 2, quantity: 10, category: "Bed"),
//    Products(productImage: "bd-2", productTitle: "Fuji Arm Chair", productSubTitle: "Hans j. wegner", productPrice: 19.20, productDescription: "The Swedish Designer Monica Forstar’s Style Is Characterised By her Enternal love For New Materials and Beautiful Pure Shapes.", rating: 2, quantity: 10, category: "Bed"),
//    Products(productImage: "bd-3", productTitle: "Fuji Arm Chair", productSubTitle: "Hans j. wegner", productPrice: 19.20, productDescription: "The Swedish Designer Monica Forstar’s Style Is Characterised By her Enternal love For New Materials and Beautiful Pure Shapes.", rating: 2, quantity: 10, category: "Bed"),
//    Products(productImage: "bd-4", productTitle: "Fuji Arm Chair", productSubTitle: "Hans j. wegner", productPrice: 19.20, productDescription: "The Swedish Designer Monica Forstar’s Style Is Characterised By her Enternal love For New Materials and Beautiful Pure Shapes.", rating: 2, quantity: 10, category: "Bed"),
//    
//    Products(productImage: "tb-1", productTitle: "Fuji Arm Chair", productSubTitle: "Hans j. wegner", productPrice: 17.70, productDescription: "The Swedish Designer Monica Forstar’s Style Is Characterised By her Enternal love For New Materials and Beautiful Pure Shapes.", rating: 3, quantity: 10, category: "Table"),
//    Products(productImage: "tb-2", productTitle: "Fuji Arm Chair", productSubTitle: "Hans j. wegner", productPrice: 17.70, productDescription: "The Swedish Designer Monica Forstar’s Style Is Characterised By her Enternal love For New Materials and Beautiful Pure Shapes.", rating: 3, quantity: 10, category: "Table"),
//    Products(productImage: "tb-3", productTitle: "Fuji Arm Chair", productSubTitle: "Hans j. wegner", productPrice: 17.70, productDescription: "The Swedish Designer Monica Forstar’s Style Is Characterised By her Enternal love For New Materials and Beautiful Pure Shapes.", rating: 3, quantity: 10, category: "Table"),
//    Products(productImage: "tb-4", productTitle: "Fuji Arm Chair", productSubTitle: "Hans j. wegner", productPrice: 17.70, productDescription: "The Swedish Designer Monica Forstar’s Style Is Characterised By her Enternal love For New Materials and Beautiful Pure Shapes.", rating: 3, quantity: 10, category: "Table")
//]


var productsDataArray: [Products] = [
    // 🪑 Chairs
    Products(productImage: "prd-1", productTitle: "Comfort Chair", productSubTitle: "Soft Cushion Back", productPrice: 49.99, productDescription: "A sleek modern chair with plush cushioning designed for comfort and style in any room.", rating: 4.8, quantity: 30, category: "Chair"),
    Products(productImage: "prd-2", productTitle: "Wooden Armchair", productSubTitle: "Classic Oak Finish", productPrice: 59.99, productDescription: "Crafted from premium oak wood with sturdy armrests, ideal for reading corners.", rating: 4.6, quantity: 25, category: "Chair"),
    Products(productImage: "prd-3", productTitle: "Lounge Chair", productSubTitle: "Velvet Texture", productPrice: 64.50, productDescription: "Elegant lounge chair upholstered with velvet fabric for maximum relaxation.", rating: 4.7, quantity: 18, category: "Chair"),
    Products(productImage: "prd-4", productTitle: "Office Chair", productSubTitle: "Adjustable Backrest", productPrice: 79.00, productDescription: "Ergonomic office chair with adjustable height and lumbar support for long hours.", rating: 4.3, quantity: 40, category: "Chair"),
    
    // 🛋️ Sofas
    Products(productImage: "sf-1", productTitle: "2-Seater Sofa", productSubTitle: "Compact & Cozy", productPrice: 129.99, productDescription: "Perfect for small spaces, this 2-seater sofa blends comfort and modern design.", rating: 4.2, quantity: 12, category: "Sofa"),
    Products(productImage: "sf-2", productTitle: "Corner Sofa", productSubTitle: "L-Shaped Fabric", productPrice: 199.00, productDescription: "Spacious corner sofa made with soft, durable fabric for family lounging.", rating: 4.5, quantity: 8, category: "Sofa"),
    Products(productImage: "sf-3", productTitle: "Leather Sofa", productSubTitle: "Premium Finish", productPrice: 249.99, productDescription: "Modern leather sofa with high-density foam cushions and sleek design.", rating: 4.6, quantity: 6, category: "Sofa"),
    Products(productImage: "sf-4", productTitle: "Recliner Sofa", productSubTitle: "3-Seater Luxury", productPrice: 275.00, productDescription: "Push-back recliner sofa with cup holders and built-in armrests.", rating: 4.4, quantity: 4, category: "Sofa"),
    
    // 🛏️ Beds
    Products(productImage: "bd-1", productTitle: "King Size Bed", productSubTitle: "With Storage Drawers", productPrice: 350.00, productDescription: "Spacious king bed with built-in storage compartments and headboard support.", rating: 4.7, quantity: 10, category: "Bed"),
    Products(productImage: "bd-2", productTitle: "Queen Bed", productSubTitle: "Minimalist Design", productPrice: 299.00, productDescription: "Modern queen bedframe with sleek wood finish and sturdy slats.", rating: 4.6, quantity: 9, category: "Bed"),
    Products(productImage: "bd-3", productTitle: "Single Bed", productSubTitle: "Compact & Strong", productPrice: 179.99, productDescription: "Perfect for small rooms, this single bed is durable and easy to assemble.", rating: 4.2, quantity: 15, category: "Bed"),
    Products(productImage: "bd-4", productTitle: "Double Bed", productSubTitle: "Wooden Frame", productPrice: 220.00, productDescription: "Classic wooden double bed with rich brown finish and solid construction.", rating: 4.3, quantity: 7, category: "Bed"),
    
    // 🪵 Tables
    Products(productImage: "tb-1", productTitle: "Coffee Table", productSubTitle: "Glass Top Finish", productPrice: 89.99, productDescription: "Modern coffee table with tempered glass top and metal legs.", rating: 4.4, quantity: 20, category: "Table"),
    Products(productImage: "tb-2", productTitle: "Dining Table", productSubTitle: "4-Seater", productPrice: 139.50, productDescription: "Perfect for small families, this dining table comes with a scratch-resistant surface.", rating: 4.5, quantity: 12, category: "Table"),
    Products(productImage: "tb-3", productTitle: "Study Table", productSubTitle: "With Drawer Storage", productPrice: 99.99, productDescription: "Spacious study table with pull-out drawer for books and supplies.", rating: 4.6, quantity: 16, category: "Table"),
    Products(productImage: "tb-4", productTitle: "Side Table", productSubTitle: "Compact & Sleek", productPrice: 45.00, productDescription: "Minimal side table ideal for living rooms and bedside use.", rating: 4.1, quantity: 22, category: "Table")
]
