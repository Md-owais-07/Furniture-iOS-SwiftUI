//
//  OrderHistoryView.swift
//  Furniture App
//
//  Created by Owais on 4/25/25.
//

import SwiftUI

struct OrderHistoryView: View {
    @EnvironmentObject var orderManager: OrderManager
    
    var body: some View {
        ZStack {
            if orderManager.orders.isEmpty {
                Text("No order placed")
            }
            ScrollView {
                LazyVStack {
                    ForEach(orderManager.orders) { order in
                        OrderRowView(order: order)
                    }
                }
            }
            .navigationTitle("Order History")
            .navigationBarTitleDisplayMode(.inline)
        }.task {
            
            orderManager.fetchOrders()
        }
    }
}

#Preview {
    OrderHistoryView()
}
