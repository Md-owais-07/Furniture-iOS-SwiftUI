//
//  MostCategoryView.swift
//  Furniture App
//
//  Created by Owais on 5/9/25.
//
//

import SwiftUI

struct MostCategoryView: View {
    @EnvironmentObject var productVM: ProductViewModel
    
    let title: String
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil)
    ]
    
    var body: some View {
        ZStack {
            Color("AppColor").ignoresSafeArea(.all)
            
            VStack {
                
                HeaderView(title: title)
                
                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: columns, spacing: 14) {
                        ForEach(productVM.products) { item in
                            ProductCardView(product: item)
                        }
                    }
                    .padding(.horizontal, 2)
                }
            }
            .navigationBarBackButtonHidden(true)
            .background(EnableSwipeBackGesture())
        }
    }
}

#Preview {
    MostCategoryView(title: "Demo")
}
