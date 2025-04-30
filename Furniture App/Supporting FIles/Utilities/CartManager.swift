//
//  CartManager.swift
//  Furniture App
//
//  Created by Owais on 2/26/25.
//

import SwiftUI

class CartManager: ObservableObject {
    @Published var items: [Products] = []
    @Published var totalPrice: Double = 0
    
    func addToCart(_ product: Products) {
        if let index = items.firstIndex(where: { $0.id == product.id }) {
            items[index].quantity += 1
        } else {
            var newProduct = product
            newProduct.quantity = 1
            items.append(newProduct)
        }
        updateTotalPrice()
    }
    
    func removeFromCart(_ product: Products) {
        if let index = items.firstIndex(where: { $0.id == product.id }) {
            if items[index].quantity > 1 {
                items[index].quantity -= 1
            } else {
                items.remove(at: index)
            }
        }
        updateTotalPrice()
    }
    
    private func updateTotalPrice() {
        totalPrice = items.reduce(0.0) { $0 + ($1.productPrice * Double($1.quantity)) }
    }
    
    func isProductInCart(_ product: Products) -> Bool {
        return items.contains(where: { $0.id == product.id })
    }
}
