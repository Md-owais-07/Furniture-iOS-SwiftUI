//
//  ProductSearchResultView.swift
//  Furniture App
//
//  Created by Owais on 5/26/25.
//

import SwiftUI

//struct ProductSearchResultView: View {
//    var product: Products
//    
//    var body: some View {
//        ZStack {
//            Color.white
//            
//            VStack {
//                NavigationLink {
//                    ProductCardView(product: product)
//                } label: {
//                    Text(product.productTitle)
//                }
//            }
//            .frame(maxWidth: .infinity, maxHeight: 40, alignment: .leading)
//        }
//    }
//}

struct ProductSearchResultView: View {
    var product: Products
    
    var body: some View {
        ZStack {
            Color("AppColor")
            
            VStack {
                NavigationLink {
                    ProductDetailView(product: product)
                } label: {
                    Text(product.productTitle)
                        .foregroundStyle(.black)
                        .padding(.vertical, 8)
                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                }
            }
            .padding(.horizontal)
        }
    }
}


#Preview {
    ProductSearchResultView(product: productsDataArray[0])
        .environmentObject(CartManager())
}



//@EnvironmentObject var cartManager: CartManager
//@State private var isAddedToCart: Bool = false
//@State private var quantity: Int = 0

//    var body: some View {
//        ZStack() {
//            Color.red
//            ZStack {
//                Color.yellow
//                VStack {
//                    Image(product.productImage)
//                        .resizable()
//                        .scaledToFill()
//                        .frame(maxWidth: 85, maxHeight: 110)
//                        .padding(.bottom, 20)
//
//                    HStack(spacing: 0) {
//                        VStack(alignment: .leading, spacing: 4) {
//                            Text(product.productTitle)
//                                .font(Font.custom("Switzer-Semibold", size: 16))
//                                .foregroundStyle(.textClr)
//
//                            Text(product.productSubTitle)
//                                .font(Font.custom("Switzer-Regular", size: 13))
//                                .foregroundStyle(.subTextClr)
//                        }
//
//                    }.frame(maxWidth: .infinity, alignment: .leading)
//
//                    Spacer()
//
//                    HStack(spacing: 0) {
//                        Text(product.productPrice.formatted(.currency(code: "USD")))
//                            .font(Font.custom("Switzer-Medium", size: 16))
//                            .foregroundStyle(.primaryButton)
//                            .frame(height: 32)
//
//                        Spacer()
//
//                        Button {
//                            if quantity == 0 {
//                                isAddedToCart = true
//                                quantity += 1
//                                cartManager.addToCart(product)
//                            } else {
//                                quantity -= 1
//                                isAddedToCart = false
//                                cartManager.removeFromCart(product)
//                            }
//                        } label: {
//                            if quantity > 0 {
//                                ProductQuantityButton(quantity: $quantity)
//                            } else {
//                                Image("addToCart")
//                                    .scaledToFit()
//                                    .frame(width: 32, height: 32)
//                                    .background(Color("primaryColor"))
//                                    .clipShape(Circle())
//                            }
//                        }
//                    }
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                }
//            }
//            .padding([.horizontal, .vertical], 16)
//        }
//        .frame(width: 190, height: 250)
//        .cornerRadius(14)
//    }
