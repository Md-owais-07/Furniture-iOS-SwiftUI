//
//  Order.swift
//  Furniture App
//
//  Created by Owais on 6/11/26.
//

import Foundation
import FirebaseFirestore

struct Order: Identifiable, Codable {
    @DocumentID var id: String?

    let orderDate: Date
    let totalAmount: Double
    let items: [CartItem]
}
