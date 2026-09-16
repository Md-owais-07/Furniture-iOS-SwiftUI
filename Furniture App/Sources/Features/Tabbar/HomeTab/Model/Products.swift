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
