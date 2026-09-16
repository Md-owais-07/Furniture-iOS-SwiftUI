//
//  CartItem.swift
//  Furniture App
//
//  Created by Owais on 6/11/26.
//

import Foundation

struct CartItem: Identifiable, Codable {
    var id: String
    let product: Products
    var quantity: Int
    
    init(id: String = UUID().uuidString, product: Products, quantity: Int) {
        self.id = id
        self.product = product
        self.quantity = quantity
    }
}


extension Products {
    static let mock = Products(
        productImage: "https://picsum.photos/300",
        productTitle: "Comfort Chair",
        productSubTitle: "Modern Style",
        productPrice: 49.99,
        productDescription: "A comfortable modern chair",
        rating: 4.8,
        category: "Chair"
    )
}

extension CartItem {

    static let mock = CartItem(
        product: .mock,
        quantity: 2
    )
}
