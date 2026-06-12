//
//  ShoppingBarView.swift
//  Furniture App
//
//  Created by Owais on 1/27/25.
//

import SwiftUI

struct ShoppingTabView: View {

    @EnvironmentObject var navManager: AppNavigationManager
    @EnvironmentObject var cartManager: FinalCartManager

    var body: some View {

        ZStack {

            Color("AppColor")
                .ignoresSafeArea()

            VStack(spacing: 0) {

                VStack {

                    // Header
                    ZStack {

                        Text("Shopping")
                            .font(Font.custom("Switzer-Medium", size: 20))
                            .foregroundStyle(Color.textClr)

                        HStack {

                            Spacer()

                            TopCircularButtonView(action: {
                                cartManager.clearCart()
                            }, imageName: "bin")
                        }
                    }

                    Spacer()

                    ScrollView(.vertical, showsIndicators: false) {

                        VStack(spacing: 24) {

                            ForEach(cartManager.items) { item in

                                AddToCartView(item: item)

                            }
                        }
                        .padding(.vertical, 24)
                    }
                }
                .padding(.horizontal, 24)

                if !cartManager.items.isEmpty {

                    VStack(spacing: 0) {

                        VStack(spacing: 0) {

                            Text("Order Summary")
                                .font(Font.custom("Switzer-Medium", size: 16))
                                .foregroundStyle(Color.textClr)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.bottom, 16)

                            VStack(spacing: 8) {

                                HStack {

                                    Text("Subtotal")
                                        .font(Font.custom("Switzer-Regular", size: 16))
                                        .foregroundStyle(Color.subTextClr)

                                    Spacer()

                                    Text("$\(cartManager.totalPrice, specifier: "%.2f")")
                                        .font(Font.custom("Switzer-Regular", size: 16))
                                        .foregroundStyle(Color.primaryButton)
                                }

                                HStack {

                                    Text("Shipping Cost")
                                        .font(Font.custom("Switzer-Regular", size: 16))
                                        .foregroundStyle(Color.subTextClr)

                                    Spacer()

                                    Text("$\(cartManager.shippingCharge, specifier: "%.2f")")
                                        .font(Font.custom("Switzer-Regular", size: 16))
                                        .foregroundStyle(Color.primaryButton)
                                }
                            }

                            Rectangle()
                                .frame(height: 1)
                                .foregroundStyle(Color("buttonShapeColor"))
                                .padding(.top, 8)

                            HStack {

                                Text("Total Payment")
                                    .font(Font.custom("Switzer-Semibold", size: 16))
                                    .foregroundStyle(Color.textClr)

                                Spacer()

                                Text("$\(cartManager.totalPayment, specifier: "%.2f")")
                                    .font(Font.custom("Switzer-Semibold", size: 16))
                                    .foregroundStyle(Color.primaryButton)
                            }
                            .padding(.top, 20)
                        }
                        .padding(24)

                        Spacer()

                        CustomButtonView(
                            action: {
                                navManager.push(.shoppingTab(.checkout))
                            },
                            title: "Check Out"
                        )
                        .padding(.horizontal, 24)
                        .padding(.bottom, 14)
                    }
                    .frame(maxWidth: .infinity, maxHeight: 268)
                    .background(.white)
                    .clipShape(
                        RoundedCorner(
                            radius: 24,
                            corners: [.topLeft, .topRight]
                        )
                    )
                }
            }

            if cartManager.items.isEmpty {

                VStack(spacing: -10) {

                    LottieView(
                        animationName: "cart2",
                        play: true,
                        loopMode: .loop
                    )
                    .frame(width: 180, height: 180)

                    Text("Your cart is empty")
                        .font(Font.custom("Switzer-Regular", size: 16))
                        .foregroundStyle(Color.subTextClr)
                }
            }
        }
    }
}

#Preview {
    ShoppingTabView()
        .environmentObject(FinalCartManager())
}
