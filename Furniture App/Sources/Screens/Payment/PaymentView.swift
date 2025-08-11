//
//  PaymentView.swift
//  Furniture App
//
//  Created by Owais on 4/22/25.
//

import SwiftUI

struct PaymentView: View {
    @State private var promoCode: String = ""
    
    @State private var cardNumberTF: String = ""
    @State private var cardHolderNameTF: String = ""
    @State private var cardExpiryDateTF: String = ""
    @State private var cardCvvTF: String = ""
    @State private var cardValidation: Bool = true
    
    @State private var toast: Toast? = nil
    @State private var isLoading: Bool = false
    @State private var isNavigating: Bool = false
    
    @EnvironmentObject var navManager: AppNavigationManager
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ZStack {
            Color("AppColor").ignoresSafeArea(.all)
            // Top Header View
            VStack(spacing: 0) {
                ZStack {
                    HStack {
                        TopCircularButtonView(action: {
                            navManager.pop()
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
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 0) {
                        // Credit Card View
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
                                    Text(cardHolderNameTF)
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
                                Text(cardNumberTF)
//                                Text("4562  1122  4595  7852")
                                    .font(Font.custom("Switzer-Semibold", size: 20))
                                    .foregroundStyle(Color.white)
                                    .kerning(2)
                                    .frame(height: 28)
                                
                                // Expiry & CVC
                                HStack {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("Exp Date")
                                            .font(Font.custom("Switzer-Regular", size: 12))
                                            .foregroundStyle(Color.cr1)
                                        Text(cardExpiryDateTF)
//                                        Text("16/23")
                                            .font(Font.custom("Switzer-Medium", size: 12))
                                            .foregroundStyle(Color.white)
                                    }
                                    
                                    Spacer()
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("CVC Number")
                                            .font(Font.custom("Switzer-Regular", size: 12))
                                            .foregroundStyle(Color.cr1)
                                        Text(cardCvvTF)
//                                        Text("962")
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
                        
                        // Credit Card Data View
                        VStack(spacing: 18) {
                            PaymentTextFieldView(title: "Card Number", placeholder: "----  ----  ----  ----", text: $cardNumberTF, isValid: $cardValidation)
                                .keyboardType(.numberPad)
                                .onChange(of: cardNumberTF) { newValue in
                                    formatCardNumber(newValue, cardNumber: &cardNumberTF)
                                }
                            PaymentTextFieldView(title: "Card Holder Name", placeholder: "Enter full name on you card", text: $cardHolderNameTF, isValid: $cardValidation)
                                .keyboardType(.namePhonePad)
                            
                            HStack(spacing: 14) {
                                PaymentTextFieldView(title: "Expiry date", placeholder: "MM/YY", text: $cardExpiryDateTF, isValid: $cardValidation)
                                    .keyboardType(.numbersAndPunctuation)
                                    .onChange(of: cardExpiryDateTF) { newValue in
                                        var cleaned = newValue.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
                                        
                                        cleaned = String(cleaned.prefix(4))
                                        
                                        if cleaned.count > 1 {
                                            cleaned.insert("/", at: cleaned.index(cleaned.startIndex, offsetBy: 2))
                                        }
                                        cardExpiryDateTF = cleaned
                                    }
                                
                                PaymentTextFieldView(title: "CVV", placeholder: "- - - ", text: $cardCvvTF, isValid: $cardValidation)
                                    .keyboardType(.numberPad)
                                    .onChange(of: cardCvvTF) { newValue in
                                        cardCvvTF = String(newValue.prefix(3))
                                    }
                            }
                            
                            HStack(spacing: 8) {
                                Button {
                                    //
                                } label: {
                                    ZStack {
                                        Image(systemName: "checkmark")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 10, height: 10)
                                            .fontWeight(.semibold)
                                            .foregroundStyle(Color.white)
                                    }
                                    .frame(width: 20, height: 20)
                                    .background(Color("primaryColor"))
                                }
                                
                                Text("Save this card for future payments")
                                    .font(Font.custom("Switzer-Regular", size: 14))
                                    .foregroundStyle(Color.textClr)
                                
                                Spacer()
                            }
                        }
                        .padding(.top, 24)
                        
//                        VStack(alignment: .leading, spacing: 20) {
//                            Text("Choose Payment Method")
//                                .font(Font.custom("Switzer-Medium", size: 20))
//                                .foregroundStyle(Color.textClr)
//                            
//                            HStack(spacing: 20) {
//                                
//                                Button {
//                                    //
//                                } label: {
//                                    ZStack {
//                                        Image("p1")
//                                    }.frame(maxWidth: .infinity, minHeight: 46).background(Color.white).cornerRadius(12)
//                                }
//                                
//                                Button {
//                                    //
//                                } label: {
//                                    ZStack {
//                                        Image("p2")
//                                    }.frame(maxWidth: .infinity, minHeight: 46).background(Color.white).cornerRadius(12)
//                                }
//                                
//                                Button {
//                                    //
//                                } label: {
//                                    ZStack {
//                                        Image("p3")
//                                    }.frame(maxWidth: .infinity, minHeight: 46).background(Color.white).cornerRadius(12)
//                                }
//                                
//                                Button {
//                                    //
//                                } label: {
//                                    ZStack {
//                                        Image("all")
//                                    }.frame(maxWidth: .infinity, minHeight: 46).background(Color.white).cornerRadius(12)
//                                }
//                            }
//                        }
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .padding(.top, 24)
                        
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
                                        ZStack {
                                            Text("Apply")
                                                .font(Font.custom("Switzer-Medium", size: 13))
                                                .foregroundStyle(Color.white)
                                        }
                                        .frame(width: 75, height: 35)
                                        .background(Color("primaryColor"))
                                        .cornerRadius(10)
                                    }
                                }
                                .padding()
                            }
                            .frame(maxWidth: .infinity, maxHeight: 54)
                            .background(Color.white)
                            .cornerRadius(14)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 24)
                        
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
                        
                        Text("$\(cartManager.total, specifier: "%.2f")")
                            .font(Font.custom("Switzer-Medium", size: 20))
                            .foregroundStyle(Color.primaryButton)
                    }
                    .frame(height: 28)
                    .padding(.vertical, 24)
                    
                    CustomButtonView(action: {
                        if cardNumberTF.isEmpty {
                            cardValidation = !cardNumberTF.isEmpty
                        } else if cardNumberTF.count < 16 {
                            cardValidation = !cardNumberTF.isEmpty
                            toast = Toast(style: .error, message: "16 digits card number is required")
                        } else if cardHolderNameTF.isEmpty {
                            cardValidation = !cardHolderNameTF.isEmpty
                        } else if cardExpiryDateTF.isEmpty {
                            cardValidation = !cardExpiryDateTF.isEmpty
                        } else if cardCvvTF.isEmpty {
                            cardValidation = !cardCvvTF.isEmpty
                        } else {
                            cardValidation = true
                            isLoading = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                isLoading = false
                                navManager.push(.shoppingTab(.verifyOtp))
                            }
                        }
                        
                    }, title: "Payment", bgColor: Color("primaryColor"), textColor: .white).padding(.bottom, 40)
                }
                .padding(.horizontal, 24)
                .frame(height: 156)
                .background(.white)
                .clipShape(RoundedCorner(radius: 24, corners: [.topLeft, .topRight]))
            }
            
            ZStack {
                if isLoading {
                    LottieView(animationName: "App-animation", play: true, loopMode: .loop)
                        .frame(width: 200, height: 200)
                }
            }
        }
        .toastView(toast: $toast)
        .navigationBarBackButtonHidden(true)
        .background(EnableSwipeBackGesture())
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

#Preview {
    PaymentView()
        .environmentObject(CartManager())
}


func formatCardNumber(_ input: String, cardNumber: inout String) {
    let cleaned = input.replacingOccurrences(of: " ", with: "")
    
    var numbersOnly = cleaned.filter { $0.isNumber }
    
    if numbersOnly.count > 16 {
        numbersOnly = String(numbersOnly.prefix(16))
    }
    
    var result = ""
    for (index, character) in numbersOnly.enumerated() {
        if index != 0 && index % 4 == 0 {
            result.append("  ")
        }
        result.append(character)
    }
    
    cardNumber = result
}


