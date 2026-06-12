//
//  PolicyView.swift
//  Furniture App
//
//  Created by Owais on 4/25/25.
//

import SwiftUI

struct PolicyView: View {
    var body: some View {
        WebView(
            url: URL(
                string: "https://www.codilar.com/privacy-policy/"
            )!
        )
        .navigationTitle("Privacy Policy")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    PolicyView()
}
