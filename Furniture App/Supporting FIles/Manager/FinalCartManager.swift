//
//  FinalCartManager.swift
//  Furniture App
//
//  Created by Owais on 6/11/26.
//

import Foundation

final class FinalCartManager: ObservableObject {
    @Published var items: [CartItem] = []
    @Published var shippingCharge: Double = 10
    @Published var deliveryFees: Double = 50
    
    func addToCart(_ product: Products) {
        if let index = items.firstIndex(
            where: { $0.product.id == product.id }
        ) {
            items[index].quantity += 1
        } else {
            items.append(
                CartItem(
                    product: product,
                    quantity: 1
                )
            )
        }
    }
    
    func removeFromCart(_ product: Products) {
        guard let index = items.firstIndex(
            where: { $0.product.id == product.id }
        ) else { return }

        if items[index].quantity > 1 {
            items[index].quantity -= 1
        } else {
            items.remove(at: index)
        }
    }
    
    func quantity(for product: Products) -> Int {
        items.first(
            where: { $0.product.id == product.id }
        )?.quantity ?? 0
    }
    
    func clearCart() {
        items.removeAll()
    }
    
    var totalPrice: Double {
        items.reduce(0) {
            $0 + ($1.product.productPrice * Double($1.quantity))
        }
    }
    
    var totalPayment: Double {
        totalPrice + shippingCharge
    }
    
    var grandTotalPayment: Double {
        totalPrice + deliveryFees
    }
}
