//
//  OrderManager.swift
//  Furniture App
//
//  Created by Owais on 6/11/26.
//

import Foundation

final class OrderManager: ObservableObject {

    @Published var orders: [Order] = []

    private let orderService = OrderService()

    func placeOrder(
        items: [CartItem],
        totalAmount: Double
    ) {

        let order = Order(
            orderDate: Date(),
            totalAmount: totalAmount,
            items: items
        )

        orders.append(order)

        orderService.saveOrder(order)
    }
    
    func fetchOrders() {

        orderService.fetchOrders { [weak self] orders in

            DispatchQueue.main.async {

                self?.orders = orders
            }
        }
    }
}
