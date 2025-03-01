//
//  DismissButtonModifier.swift
//  Furniture App
//
//  Created by Owais on 2/24/25.
//

import SwiftUI

struct DismissButtonModifier: ViewModifier {
    @Environment(\.dismiss) private var dismiss
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    TopCircularButtonView(action: {
                        dismiss()
                    }, imageName: "backBtn")
                }
            }
    }
}

extension View {
    func withDismissButton() -> some View {
        self.modifier(DismissButtonModifier())
    }
}
