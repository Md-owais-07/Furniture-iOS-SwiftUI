//
//  DismissButtonModifier.swift
//  Furniture App
//
//  Created by Owais on 2/24/25.
//

import SwiftUI

struct DismissButtonModifier: ViewModifier {
    @EnvironmentObject var navManager: AppNavigationManager
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    TopCircularButtonView(action: {
                        navManager.pop()
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
