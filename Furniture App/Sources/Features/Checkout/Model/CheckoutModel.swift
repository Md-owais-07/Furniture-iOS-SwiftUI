//
//  CheckoutModel.swift
//  Furniture App
//
//  Created by Owais on 9/1/26.
//

import SwiftUI

struct CheckoutModel: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let image: String
}

let checkoutData: [CheckoutModel] = [
    CheckoutModel(title: "Credit Card", image: "p1"),
    CheckoutModel(title: "Paypal", image: "p2"),
    CheckoutModel(title: "Apple Pay", image: "p3"),
    CheckoutModel(title: "Others", image: "all")
]
