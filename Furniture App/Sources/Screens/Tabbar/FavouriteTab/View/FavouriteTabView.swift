//
//  FavouriteBarView.swift
//  Furniture App
//
//  Created by Owais on 1/27/25.
//

import SwiftUI

struct FavouriteTabView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color("AppColor").ignoresSafeArea(.all)
                
                    VStack(spacing: 0) {
                        HStack(spacing: 0) {
                            TopCircularButtonView(action: {
                                //
                            }, imageName: "backBtn")
                            Spacer()
                            
                            Text("Favourite")
                                .font(Font.custom("Switzer-Medium", size: 20))
                                .foregroundStyle(Color.textClr)
                            
                            Spacer()
                            TopCircularButtonView(action: {
                                //
                            }, imageName: "fav")
                        }
                        .padding(.top, 8)
                        .frame(height: 48)
                        
                        ScrollView {
                            
                        }
                    }
                    .padding(.horizontal, 24)
                }
            }
        
    }
}

#Preview {
    FavouriteTabView()
}
