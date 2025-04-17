//
//  Coordinator.swift
//  Furniture App
//
//  Created by Owais on 4/8/25.
//

import SwiftUI

final class Coordinator: ObservableObject {
    @Published var path = NavigationPath()
    
    func push(_ route: Route) {
        path.append(route)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    @ViewBuilder
    func build(route: Route) -> some View {
//        switch route {
//        case .ProductDetail:
////            ProductDetailView()
//        case .AccountSettings:
////            AccountSettingsView()
//        }
    }
}
