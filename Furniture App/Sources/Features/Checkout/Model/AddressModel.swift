//
//  AddressModel.swift
//  Furniture App
//
//  Created by Owais on 9/2/26.
//

import SwiftUI

struct AddressModel: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let number: String
    let address: String
}

let addressData: [AddressModel] = [
    AddressModel(title: "Home Address", number: "+91 9876543210", address: "HSR Layout, Bengaluru"),
    AddressModel(title: "Office Address", number: "+91 9876543210", address: "Indira Nagar, New Delhi"),
]
