//
//  ProductDetailView.swift
//  Furniture App
//
//  Created by Owais on 2/20/25.
//

import SwiftUI

struct ProductDetailView: View {
    var product: Products
    @State private var quantity: Int = 0
    @State private var price: Int = 0
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color("AppColor").ignoresSafeArea(.all)
            ScrollView {
                VStack {
                    VStack {
                        
                        HStack(spacing: 0) {
                            TopCircularButtonView(action: {
                                dismiss()
                            }, imageName: "backBtn")
                            
                            Spacer()
                            
                            TopCircularButtonView(action: {
                                //
                            }, imageName: "fav")
                        }.padding(.vertical, 8)
                        
                        ZStack {
                            Image(product.productImage)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 205, height: 210)
                                .padding(.bottom, 26)
                            
                        }.padding(.horizontal, 8)
                        
                        HStack(spacing: 0) {
                            Text("\(product.productTitle)\n Modern Style")
                                .font(Font.custom("Switzer-Medium", size: 24))
                                .foregroundStyle(Color.textClr)
                            
                            Spacer()
                            
                            Text(product.productPrice.formatted(.currency(code: "USD")))
                                .font(Font.custom("Switzer-Medium", size: 24))
                                .foregroundStyle(Color.primaryButton)
                        }
                        .padding(.vertical, 24)
                        
                        HStack(spacing: 0) {
                            VStack(spacing: 12) {
                                HStack(spacing: 8) {
                                    HStack(spacing: 4) {
                                        Image("people")
                                            .resizable()
                                            .renderingMode(.template)
                                            .foregroundStyle(Color.subTextClr)
                                            .frame(width: 22, height: 22)
                                        
                                        Text("341 Seen")
                                            .font(Font.custom("Switzer-Regular", size: 13))
                                            .foregroundStyle(Color.subTextClr)
                                    }
                                    
                                    HStack(spacing: 4) {
                                        Image("favourite")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .foregroundStyle(Color.subTextClr)
                                            .frame(width: 22, height: 22)
                                        
                                        Text("200 Liked")
                                            .font(Font.custom("Switzer-Regular", size: 13))
                                            .foregroundStyle(Color.subTextClr)
                                    }
                                }
                                
                                HStack(spacing: 4) {
                                    ForEach(0..<product.maxStars, id: \.self) { index in
                                        if Double(index) < product.rating {
                                            if Double(index) + 0.5 == product.rating {
                                                Image(systemName: "star.leadinghalf.filled")
                                            } else {
                                                Image(systemName: "star.fill")
                                            }
                                        } else {
                                            Image(systemName: "star")
                                        }
                                    }
                                }
                                .padding(.leading, -56)
                                .foregroundColor(.yellow)
                                .font(.system(size: 15))
                            }
                            
                            Spacer()
                            
                            
                        }.padding(.bottom, 24)
                        
                        VStack(spacing: 8) {
                            Text("Description")
                                .font(Font.custom("Switzer-Medium", size: 20))
                                .foregroundStyle(Color.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text(product.productDescription)
                                .font(Font.custom("Switzer-Regular", size: 14))
                                .foregroundStyle(Color.subTextClr)
                                .multilineTextAlignment(.leading)
                                .lineSpacing(2)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                    }
                    .padding(.horizontal, 24)
                    .padding(.bottom, 21)
                }
            }
            ZStack {
//                BottomButtonView(price: product.productPrice.formatted(.currency(code: "USD")), quantity: $quantity)
                
                BottomButtonView(price: product.productPrice.formatted(.currency(code: "USD")))
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ProductDetailView(product: productsDataArray[1])
}
