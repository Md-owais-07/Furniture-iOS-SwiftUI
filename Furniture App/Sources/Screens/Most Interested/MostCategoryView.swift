//
//  MostCategoryView.swift
//  Furniture App
//
//  Created by Owais on 5/9/25.
//
//
//import SwiftUI
//
//struct MostCategoryView: View {
//    //    var product: Products
//    let columns = [
//        GridItem(.flexible(), spacing: 0),
//        GridItem(.flexible(), spacing: 0)
//    ]
//
//    var body: some View {
//        ZStack {
//            Color("AppColor").ignoresSafeArea(.all)
//
//            VStack {
//                HeaderView(title: "Most Interested")
//                LazyVGrid(columns: columns, spacing: 190) {
//                    ScrollView {
//                        ForEach(productsDataArray) { items in
//                            ProductCardView(product: items)
//                        }
//                    }
//                }
//            }
//        }
//    }
//}
//
//#Preview {
//    MostCategoryView()
//}



import SwiftUI

struct MostCategoryView: View {
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: nil, alignment: nil),
        GridItem(.flexible(), spacing: nil, alignment: nil)
    ]
    
    var body: some View {
        ZStack {
            Color("AppColor").ignoresSafeArea(.all)
            
            VStack {
                HeaderView(title: "Most Interested")
                
                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: columns, spacing: 14) {
                        ForEach(productsDataArray) { item in
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
    MostCategoryView()
}
