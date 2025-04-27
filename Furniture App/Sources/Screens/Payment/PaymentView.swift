//
//  PaymentView.swift
//  Furniture App
//
//  Created by Owais on 4/22/25.
//

import SwiftUI

struct PaymentView: View {
    @State private var promoCode: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color("AppColor").ignoresSafeArea(.all)
            // Top Header View
            VStack(spacing: 0) {
                ZStack {
                    HStack {
                        TopCircularButtonView(action: {
                            dismiss()
                        }, imageName: "backBtn")
                        
                        Spacer()
                    }
                    
                    ZStack {
                        Text("Payment")
                            .font(Font.custom("Switzer-Medium", size: 20))
                            .foregroundStyle(Color.textClr)
                    }
                }
                .padding(.horizontal, 24)
                
                ScrollView {
                    VStack {
                        ZStack {
                            // Background Gradient
                            RoundedRectangle(cornerRadius: 18)
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color("gradient")]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .frame(height: 180)
                            
                            VStack(alignment: .leading, spacing: 24) {
                                // Cardholder Name & Logo
                                HStack {
                                    Text("Mansurul hoque")
                                        .font(Font.custom("Switzer-Semibold", size: 16))
                                        .foregroundStyle(Color.white)
                                    
                                    Spacer()
                                    
                                    // Use SF Symbol or Image here
                                    Image("p1")
                                        .resizable()
                                        .frame(width: 38, height: 24)
                                        .foregroundColor(.orange)
                                }
                                
                                // Card Number
                                Text("4562  1122  4595  7852")
                                    .font(Font.custom("Switzer-Semibold", size: 20))
                                    .foregroundStyle(Color.white)
                                    .kerning(2)
                                
                                // Expiry & CVC
                                HStack {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("Exp Date")
                                            .font(Font.custom("Switzer-Regular", size: 12))
                                            .foregroundStyle(Color.cr1)
                                        Text("16/23")
                                            .font(Font.custom("Switzer-Medium", size: 12))
                                            .foregroundStyle(Color.white)
                                    }
                                    
                                    Spacer()
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("CVC Number")
                                            .font(Font.custom("Switzer-Regular", size: 12))
                                            .foregroundStyle(Color.cr1)
                                        Text("962")
                                            .font(Font.custom("Switzer-Medium", size: 12))
                                            .foregroundStyle(Color.white)
                                    }
                                    
                                    Spacer()
                                    
                                    Text("Master Card")
                                        .font(Font.custom("Switzer-Medium", size: 12))
                                        .foregroundStyle(Color.white)
                                }
                            }
                            .padding(.horizontal, 24)
                        }
                        
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Choose Payment Method")
                                .font(Font.custom("Switzer-Medium", size: 20))
                                .foregroundStyle(Color.textClr)
                            
                            HStack(spacing: 20) {
                                
                                Button {
                                    //
                                } label: {
                                    ZStack {
                                        Image("p1")
                                    }.frame(maxWidth: .infinity, minHeight: 46).background(Color.white).cornerRadius(12)
                                }
                                
                                Button {
                                    //
                                } label: {
                                    ZStack {
                                        Image("p2")
                                    }.frame(maxWidth: .infinity, minHeight: 46).background(Color.white).cornerRadius(12)
                                }
                                
                                Button {
                                    //
                                } label: {
                                    ZStack {
                                        Image("p3")
                                    }.frame(maxWidth: .infinity, minHeight: 46).background(Color.white).cornerRadius(12)
                                }
                                
                                Button {
                                    //
                                } label: {
                                    ZStack {
                                        Image("all")
                                    }.frame(maxWidth: .infinity, minHeight: 46).background(Color.white).cornerRadius(12)
                                }
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 24)
                        
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Promo Code")
                                .font(Font.custom("Switzer-Medium", size: 20))
                                .foregroundStyle(Color.textClr)
                            
                            HStack {
                                TextField("Enter Promo Code", text: $promoCode)
                                    .padding(.leading, 16)
                                
                                HStack {
                                    Button {
                                        //
                                    } label: {
                                        Text("Apply")
                                            .font(Font.custom("Switzer-Medium", size: 13))
                                            .foregroundStyle(Color.white)
                                    }
                                    .frame(width: 75, height: 35)
                                    .background(Color("primaryColor"))
                                    .cornerRadius(10)
                                }
                                .padding()
                            }
                            .frame(maxWidth: .infinity, maxHeight: 54)
                            .background(Color.white)
                            .cornerRadius(14)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 24)
                        
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 24)
                    
                }
                
                VStack(spacing: 0) {
                    HStack {
                        Text("Total Payment")
                            .font(Font.custom("Switzer-Medium", size: 20))
                            .foregroundStyle(Color.textClr)
                        
                        Spacer()
                        
                        Text("$58.80")
                            .font(Font.custom("Switzer-Medium", size: 20))
                            .foregroundStyle(Color.primaryButton)
                    }
                    .frame(height: 28)
                    .padding(.vertical, 24)
                    
                    CustomButtonView(action: {
                        //
                    }, title: "Payment", bgColor: Color("primaryColor"), textColor: .white).padding(.bottom, 40)
                }
                .padding(.horizontal, 24)
                .frame(height: 156)
                .background(.white)
                .clipShape(RoundedCorner(radius: 24, corners: [.topLeft, .topRight]))
            }
        }
        .navigationBarBackButtonHidden(true)
        .background(EnableSwipeBackGesture())
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

#Preview {
    PaymentView()
}
