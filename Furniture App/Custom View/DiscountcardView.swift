//
//  DiscountcardView.swift
//  Furniture App
//
//  Created by Owais on 1/29/25.
//

import SwiftUI

//struct DiscountcardView: View {
//    var title: String
//    var subTitle: String
//    var buttonTitle: String
//    var imageName: String?
//    
//    var body: some View {
//        ZStack(alignment: .leading) {
//            Image("img3")
//                .resizable()
//                .frame(maxWidth: .infinity, maxHeight: 130)
//                .scaledToFill()
//                .cornerRadius(14)
//            
//            
//            VStack(alignment: .leading, spacing: 0) {
//                Text("25")
//                    .font(Font.custom("Switzer-Semibold", size: 20))
//                    .foregroundStyle(.white)
//                
//                Text("for")
//                    .font(Font.custom("Switzer-Regular", size: 13))
//                    .foregroundStyle(.white.opacity(0.72))
//                    .padding(.top, 4)
//                
//                Button {
//                    //
//                } label: {
//                    Text("Learn more")
//                        .font(Font.custom("Switzer-Regular", size: 13))
//                        .foregroundStyle(.white)
//                        .frame(width: 92, height: 34)
//                        .background(Color("primaryColor"))
//                        .cornerRadius(50)
//                }
//                .padding(.top, 16)
//            }
//            .padding(.horizontal, 16)
//        }
////        .frame(maxWidth: .infinity, maxHeight: 130)
////        .cornerRadius(14)
//    }
//}

import SwiftUI

struct DiscountcardView: View {
    var title: String
    var subTitle: String
    var buttonTitle: String
    var imageName: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            // Background Image
            Image(imageName)
                .resizable()
                .scaledToFill() // Ensures the image scales to fill the space
//                .frame(minWidth: 300, maxHeight: 400)
                .clipped() 
                .cornerRadius(14)
            
            // Foreground Content
            VStack(alignment: .leading, spacing: 0) {
                Text(title)
                    .font(Font.custom("Switzer-Semibold", size: 20))
                    .foregroundStyle(.white)
                
                Text(subTitle)
                    .font(Font.custom("Switzer-Regular", size: 13))
                    .foregroundStyle(.white.opacity(0.72))
                    .padding(.top, 4)
                
                Button {
                    // Add action here
                } label: {
                    Text(buttonTitle)
                        .font(Font.custom("Switzer-Regular", size: 13))
                        .foregroundStyle(.white)
                        .frame(width: 92, height: 34)
                        .background(Color("primaryColor"))
                        .cornerRadius(50)
                }
                .padding(.top, 16)
            }
            .padding(.horizontal, 16)
        }
        .frame(minWidth: 300, maxHeight: 150)
        .cornerRadius(14)
        .padding(.horizontal, 24)
        .padding(.vertical, 0)
    }
}


#Preview {
    DiscountcardView(title: "", subTitle: "", buttonTitle: "", imageName: "img3")
}
