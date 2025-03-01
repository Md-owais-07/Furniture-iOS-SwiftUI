//
//  CustomNavigationViewModifier.swift
//  Furniture App
//
//  Created by Owais on 2/24/25.
//

import SwiftUI

struct CustomNavigationViewModifier: ViewModifier {
    @Environment(\.dismiss) private var dismiss // Enables swipe back

    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true) // Hide default back button
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
    func customNavigation() -> some View {
        self.modifier(CustomNavigationViewModifier())
    }
}
