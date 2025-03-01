//
//  BounceDisabledScrollView.swift
//  Furniture App
//
//  Created by Owais on 2/21/25.
//

import SwiftUI

struct BounceDisabledScrollView<Content: View>: UIViewRepresentable {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    func makeUIView(context: Context) -> UIScrollView {
        let scrollView = UIScrollView()
        let hostingController = UIHostingController(rootView: content)
        
        // Disable bounce effect
        scrollView.bounces = false
        scrollView.alwaysBounceVertical = false
        scrollView.alwaysBounceHorizontal = false
        
        // Set background color to match SwiftUI's ZStack color
        scrollView.backgroundColor = UIColor(named: "AppColor") // Make sure the color exists in Assets
        
        // Add SwiftUI content as a subview
        scrollView.addSubview(hostingController.view)
        
        // Ensure SwiftUI view resizes correctly
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: scrollView.topAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            hostingController.view.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        return scrollView
    }

    func updateUIView(_ uiView: UIScrollView, context: Context) {}
}
