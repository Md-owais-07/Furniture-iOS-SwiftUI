//
//  UIViewRepresentable.swift
//  Furniture App
//
//  Created by Owais on 4/2/25.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    var animationName: String
    var play: Bool
    var loopMode: LottieLoopMode

    let animationView = LottieAnimationView()

    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        animationView.animation = LottieAnimation.named(animationName)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode

        view.addSubview(animationView)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        if play {
            animationView.play()
        } else {
            animationView.stop()
        }
    }
}
