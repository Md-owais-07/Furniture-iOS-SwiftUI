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
        Group {
            if orderManager.isLoading {
                ProgressView()
            } else if orderManager.orders.isEmpty {
                Text("No order placed")
            } else {
                ScrollView {
                    LazyVStack(spacing: 10) {
                        ForEach(orderManager.orders) { order in
                            OrderRowView(order: order)
                        }
                    }
                }
            }
        }
        .navigationTitle("Order History")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            orderManager.fetchOrders()
        }
    }
}

#Preview {
    OrderHistoryView()
        .environmentObject(OrderManager())
        .environmentObject(FinalCartManager())
}
