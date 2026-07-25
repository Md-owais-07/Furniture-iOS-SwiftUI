//
//  Products.swift
//  Furniture App
//
//  Created by Owais on 1/29/25.
//

import Foundation
import FirebaseFirestore

// MARK: - Category Model
struct Category: Identifiable, Codable, Equatable {
    @DocumentID var id: String?
    
    let name: String
    let image: String
}

struct Products: Identifiable, Codable {
    @DocumentID var id: String?
    
    let productImage: String
    let productTitle: String
    let productSubTitle: String
    let productPrice: Double
    let productDescription: String
    let rating: Double
    let category: String
    var maxStars: Int {
        5
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
//    // 🪑 Chairs
//    Products(productImage: "https://firebasestorage.googleapis.com/v0/b/furniture-push.firebasestorage.app/o/Product%20images%2Fch-1.png?alt=media&token=6f69ab63-f016-4c1c-bd1e-7d53c8f403a4", productTitle: "Comfort Chair", productSubTitle: "Soft Cushion Back", productPrice: 49.99, productDescription: "A sleek modern chair with plush cushioning designed for comfort and style in any room.", rating: 4.8, category: "Chair"),
//    Products(productImage: "https://firebasestorage.googleapis.com/v0/b/furniture-push.firebasestorage.app/o/Product%20images%2Fch-2.png?alt=media&token=fe7d4063-543c-4243-9077-a09d47e09a83", productTitle: "Wooden Armchair", productSubTitle: "Classic Oak Finish", productPrice: 59.99, productDescription: "Crafted from premium oak wood with sturdy armrests, ideal for reading corners.", rating: 4.6, category: "Chair"),
//    Products(productImage: "https://firebasestorage.googleapis.com/v0/b/furniture-push.firebasestorage.app/o/Product%20images%2Fch-3.png?alt=media&token=577f227f-3051-4ff9-bb49-7f08672c09eb", productTitle: "Lounge Chair", productSubTitle: "Velvet Texture", productPrice: 64.50, productDescription: "Elegant lounge chair upholstered with velvet fabric for maximum relaxation.", rating: 4.7, category: "Chair"),
//    Products(productImage: "https://firebasestorage.googleapis.com/v0/b/furniture-push.firebasestorage.app/o/Product%20images%2Fch-4.png?alt=media&token=bb3b9026-4b07-4f85-8eed-34638bb213fb", productTitle: "Office Chair", productSubTitle: "Adjustable Backrest", productPrice: 79.00, productDescription: "Ergonomic office chair with adjustable height and lumbar support for long hours.", rating: 4.3, category: "Chair"),
//    
//    // 🛋️ Sofas
//    Products(productImage: "https://firebasestorage.googleapis.com/v0/b/furniture-push.firebasestorage.app/o/Product%20images%2Fsf-5.png?alt=media&token=9b2b8191-70ed-41b0-a6d4-50ae6c531adf", productTitle: "2-Seater Sofa", productSubTitle: "Compact & Cozy", productPrice: 129.99, productDescription: "Perfect for small spaces, this 2-seater sofa blends comfort and modern design.", rating: 4.2, category: "Sofa"),
//    Products(productImage: "https://firebasestorage.googleapis.com/v0/b/furniture-push.firebasestorage.app/o/Product%20images%2Fsf-4.png?alt=media&token=faa7c46e-e9e1-4fe7-bf83-33eadb3667b0", productTitle: "Corner Sofa", productSubTitle: "L-Shaped Fabric", productPrice: 199.00, productDescription: "Spacious corner sofa made with soft, durable fabric for family lounging.", rating: 4.5, category: "Sofa"),
//    Products(productImage: "https://firebasestorage.googleapis.com/v0/b/furniture-push.firebasestorage.app/o/Product%20images%2Fsf-3.png?alt=media&token=8e8af9be-e62f-466b-ad9f-516e5acbcb78", productTitle: "Leather Sofa", productSubTitle: "Premium Finish", productPrice: 249.99, productDescription: "Modern leather sofa with high-density foam cushions and sleek design.", rating: 4.6, category: "Sofa"),
//    Products(productImage: "https://firebasestorage.googleapis.com/v0/b/furniture-push.firebasestorage.app/o/Product%20images%2Fsf-1.png?alt=media&token=7f0b5fe7-1901-4d88-8668-23718d21565a", productTitle: "Recliner Sofa", productSubTitle: "3-Seater Luxury", productPrice: 275.00, productDescription: "Push-back recliner sofa with cup holders and built-in armrests.", rating: 4.4, category: "Sofa"),
//    
//    // 🛏️ Beds
//    Products(productImage: "https://firebasestorage.googleapis.com/v0/b/furniture-push.firebasestorage.app/o/Product%20images%2Fbd-1.png?alt=media&token=54d98664-b780-4afc-9d51-f752a93b4c93", productTitle: "King Size Bed", productSubTitle: "With Storage Drawers", productPrice: 350.00, productDescription: "Spacious king bed with built-in storage compartments and headboard support.", rating: 4.7, category: "Bed"),
//    Products(productImage: "https://firebasestorage.googleapis.com/v0/b/furniture-push.firebasestorage.app/o/Product%20images%2Fbd-2.png?alt=media&token=96a0cf5b-9833-4b45-a5bb-53e201364a96", productTitle: "Queen Bed", productSubTitle: "Minimalist Design", productPrice: 299.00, productDescription: "Modern queen bedframe with sleek wood finish and sturdy slats.", rating: 4.6, category: "Bed"),
//    Products(productImage: "https://firebasestorage.googleapis.com/v0/b/furniture-push.firebasestorage.app/o/Product%20images%2Fbd-3.png?alt=media&token=05ed1b0a-38c9-4a43-bd3d-653f5b71f13a", productTitle: "Single Bed", productSubTitle: "Compact & Strong", productPrice: 179.99, productDescription: "Perfect for small rooms, this single bed is durable and easy to assemble.", rating: 4.2, category: "Bed"),
//    Products(productImage: "https://firebasestorage.googleapis.com/v0/b/furniture-push.firebasestorage.app/o/Product%20images%2Fbd-4.png?alt=media&token=13b94543-9d99-41e3-a347-70bea9e5c4bc", productTitle: "Double Bed", productSubTitle: "Wooden Frame", productPrice: 220.00, productDescription: "Classic wooden double bed with rich brown finish and solid construction.", rating: 4.3, category: "Bed"),
//    
//    // 🪵 Tables
//    Products(productImage: "https://firebasestorage.googleapis.com/v0/b/furniture-push.firebasestorage.app/o/Product%20images%2Ftb-2.png?alt=media&token=6a697aab-c273-4cea-8ff8-2e236c4a2cc5", productTitle: "Coffee Table", productSubTitle: "Glass Top Finish", productPrice: 89.99, productDescription: "Modern coffee table with tempered glass top and metal legs.", rating: 4.4, category: "Table"),
//    Products(productImage: "https://firebasestorage.googleapis.com/v0/b/furniture-push.firebasestorage.app/o/Product%20images%2Ftb-1.png?alt=media&token=1a3434b9-f1ae-4696-9a31-8a7bc7204aca", productTitle: "Dining Table", productSubTitle: "4-Seater", productPrice: 139.50, productDescription: "Perfect for small families, this dining table comes with a scratch-resistant surface.", rating: 4.5, category: "Table"),
//    Products(productImage: "https://firebasestorage.googleapis.com/v0/b/furniture-push.firebasestorage.app/o/Product%20images%2Ftb-3.png?alt=media&token=ea3cb8c8-ed39-4d80-8996-9df6bad6934d", productTitle: "Study Table", productSubTitle: "With Drawer Storage", productPrice: 99.99, productDescription: "Spacious study table with pull-out drawer for books and supplies.", rating: 4.6, category: "Table"),
//    Products(productImage: "https://firebasestorage.googleapis.com/v0/b/furniture-push.firebasestorage.app/o/Product%20images%2Ftb-4.png?alt=media&token=c9a31546-cae9-4187-ac26-63dd3f046e01", productTitle: "Side Table", productSubTitle: "Compact & Sleek", productPrice: 45.00, productDescription: "Minimal side table ideal for living rooms and bedside use.", rating: 4.1, category: "Table")
//]
