//
//  OrderService.swift
//  Furniture App
//
//  Created by Owais on 6/12/26.
//

import FirebaseFirestore
import FirebaseAuth

final class OrderService {

    private let db = Firestore.firestore()

    func saveOrder(_ order: Order) {

        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }

        do {

            try db
                .collection("users")
                .document(userId)
                .collection("orders")
                .addDocument(from: order)

        } catch {

            print(error.localizedDescription)
        }
    }
    
    func fetchOrders(
        completion: @escaping ([Order]) -> Void
    ) {

        guard let userId = Auth.auth().currentUser?.uid else {
            completion([])
            return
        }

        db.collection("users")
            .document(userId)
            .collection("orders")
            .order(by: "orderDate", descending: true)
            .getDocuments { snapshot, error in

                guard let documents = snapshot?.documents else {
                    completion([])
                    return
                }

                let orders = documents.compactMap {
                    try? $0.data(as: Order.self)
                }

                completion(orders)
            }
    }
}
