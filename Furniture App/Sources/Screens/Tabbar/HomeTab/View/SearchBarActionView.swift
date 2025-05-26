//
//  SearchBarActionView.swift
//  Furniture App
//
//  Created by Owais on 5/26/25.
//

import SwiftUI

struct SearchBarActionView: View {
    @State private var searchText: String = ""
    @State private var searchResults: [Products] = []
    
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            Color("AppColor").ignoresSafeArea(.all)
            
            VStack {
                HStack(spacing: 10) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .foregroundStyle(.black)
                    }
                    .frame(width: 20, height: 20)

                    HStack(spacing: 0) {
                        
                        HStack {
                            Image("search")
                                .resizable()
                                .frame(width: 20, height: 20)
                        }
                        .frame(width: 40)
                        
                        TextField("Search Furniture", text: $searchText)
                            .font(Font.custom("Switzer-Regular", size: 16))
                            .foregroundStyle(.subTextClr)
                            .frame(height: 48)
                            .onChange(of: searchText) { newValue in
                                // Live search logic
                                if newValue.isEmpty {
                                    searchResults = []
                                } else {
                                    searchResults = productsDataArray.filter {
                                        $0.productTitle.lowercased().contains(newValue.lowercased())
                                    }
                                }
                            }
                    }
                    .frame(height: 48)
                    .background(.white)
                    .cornerRadius(12)
                }
                
                
                if searchText.isEmpty {
                    Text("Type something to search")
                        .foregroundStyle(.gray)
                        .padding(.top, 16)
                } else if searchResults.isEmpty {
                    Text("No results found")
                        .foregroundStyle(.gray)
                        .padding(.top, 16)
                } else {
                    ScrollView {
                        LazyVStack(spacing: 12) {
                            ForEach(searchResults) { product in
                                ProductSearchResultView(product: product)
                            }
                        }
                        .padding(.top, 20)
                    }
                }
                
                Spacer()
            }
            .padding(.top, 16)
            .padding(.leading, 10)
            .padding(.trailing, 24)
            .navigationBarBackButtonHidden(true)
            .background(EnableSwipeBackGesture())
        }
    }
}


//struct SearchBarActionView: View {
//    @State private var searchText: String = ""
//    @State private var searchResults: [Products] = []
//    
//    var body: some View {
//        VStack {
//            HStack {
//                TextField("Search Furniture", text: $searchText)
//                    .font(Font.custom("Switzer-Regular", size: 16))
//                    .foregroundStyle(.subTextClr)
//                
//                Spacer()
//                
//                Button {
//                    searchResults = productsDataArray.filter {
//                        $0.productTitle.lowercased().contains(searchText.lowercased())
//                    }
//                } label: {
//                    Text("Go")
//                        .foregroundStyle(Color.black)
//                }
//
//            }
//            
//            if searchResults.isEmpty {
//                Text("No results found")
//                    .foregroundStyle(.gray)
//                    .padding(.top, 16)
//            } else {
//                ScrollView {
//                    LazyVStack(spacing: 12) {
//                        ForEach(searchResults) { product in
//                            ProductSearchResultView(product: product)
//                        }
//                    }
//                    .padding(.top, 20)
//                }
//            }
//            
//            Spacer()
//        }
//        .padding(.top, 50)
//        .padding(.horizontal, 24)
//    }
//}

#Preview {
    SearchBarActionView()
}
