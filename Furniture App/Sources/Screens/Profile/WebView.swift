//
//  WebView.swift
//  Furniture App
//
//  Created by Owais on 6/11/26.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {

    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }

    func updateUIView(
        _ webView: WKWebView,
        context: Context
    ) {
        webView.load(
            URLRequest(url: url)
        )
    }
}

#Preview {
    WebView(url: URL(string: "https://www.codilar.com/privacy-policy/")!)
}
