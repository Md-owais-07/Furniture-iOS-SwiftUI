//
//  LoadserverImageView.swift
//  Furniture App
//
//  Created by Owais on 6/12/26.
//

import SwiftUI
import Kingfisher

struct LoadserverImageView: View {
    
    let urlString: String
    
    var body: some View {
        
        KFImage(URL(string: urlString))
            .placeholder {
                ProgressView()
            }
            .onFailure { error in
                print("Image Error:", error)
            }
            .retry(maxCount: 3, interval: .seconds(2))
            .cancelOnDisappear(true)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}
