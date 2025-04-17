//
//  RoundedCorner.swift
//  Furniture App
//
//  Created by Owais on 4/10/25.
//

import SwiftUI

struct RoundedCorner: Shape {
    var radius: CGFloat = 20
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
