//
//  CustomNavigationViewModifier.swift
//  Furniture App
//
//  Created by Owais on 2/24/25.
//

import SwiftUI

struct CustomNavigationViewModifier: ViewModifier {
    @EnvironmentObject var navManager: AppNavigationManager

    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
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
    func customNavigation() -> some View {
        self.modifier(CustomNavigationViewModifier())
    }
}
