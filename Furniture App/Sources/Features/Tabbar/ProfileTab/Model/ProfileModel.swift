//
//  ProfileModel.swift
//  Furniture App
//
//  Created by Owais on 4/3/25.
//

import SwiftUI

// MARK: - Model
struct MenuItem: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    let action: () -> Void
}


