//
//  VerifyOtpView.swift
//  Furniture App
//
//  Created by Owais on 4/28/25.
//

import SwiftUI

struct VerifyOtpView: View {
    @EnvironmentObject var navManager: AppNavigationManager
    @Environment(\.dismiss) var dismiss
    
    @State private var otp: String = ""
    @State private var isPresent: Bool = false
    
    @State private var isLoading: Bool = false
    @State private var isLoading1: Bool = false
    @State private var toast: Toast? = nil
    
    var body: some View {
        ZStack {
            Color("AppColor").ignoresSafeArea(.all)
            
            VStack(spacing: 0) {
                ZStack {
                    HStack {
                        TopCircularButtonView(action: {
                            navManager.pop()
                        }, imageName: "backBtn")
                        
                        Spacer()
                    }
                    
                    ZStack {
                        Text("Payment Verification")
                            .font(Font.custom("Switzer-Medium", size: 20))
                            .foregroundStyle(Color.textClr)
                    }
                }
                .padding(.horizontal, 24).padding(.top, 6)
                
                VStack(spacing: 10) {
                    Text("Enter Your\nOne-Time Password (OTP)")
                        .font(Font.custom("Switzer-Semibold", size: 18))
                        .foregroundStyle(Color("primaryColor"))
                        .multilineTextAlignment(.center)
                    
                    Text("(sent to +91********78)")
                        .font(Font.custom("Switzer-Medium", size: 13))
                        .foregroundStyle(Color("primaryColor").opacity(0.6))
                }
                .padding(.top, 60)
                
                VStack {
                    OtpTextField(otp: $otp)
                }.padding(.top, 70)
                
                
                VStack(spacing: 16) {
                    Button {
                        isLoading = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                            isLoading = false
                            isLoading1 = true
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                                isLoading1 = false
                                isPresent = true
                                
                            }
                            
                        }
                        
                    } label: {
                        ZStack {
                            Text("Verify")
                                .font(Font.custom("Switzer-Semibold", size: 18))
                                .foregroundStyle(Color.white)
                        }
                        .frame(width: 160, height: 44).background(Color("primaryColor")).cornerRadius(12)
                    }
                    
                    
                    Button {
                        
                    } label: {
                        ZStack {
                            Text("Resend OTP")
                                .font(Font.custom("Switzer-Semibold", size: 14))
                                .foregroundStyle(Color("primaryColor"))
                        }
                        .frame(width: 160, height: 44).background(Color.white).overlay {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color("primaryColor"), lineWidth: 1)
                        }
                    }
                }.padding(.top, 55)
                
                Spacer()
                
            }
            .sheet(isPresented: $isPresent) {
                print("On Dismiss Press")
                navManager.popToRootWithTab(.home)
            } content: {
                VStack(spacing: 0) {
                    VStack(spacing: 0) {
                        ZStack {
                            LottieView(animationName: "paymentSuccess", play: true, loopMode: .loop)
                        }.frame(width: 150, height: 150)
                        
                        VStack(spacing: 10) {
                            Text("Your Order is \n Confirmed")
                                .font(Font.custom("Switzer-Medium", size: 24))
                                .multilineTextAlignment(.center)
                                .foregroundStyle(Color.textClr)
                            
                            Text("Your order been place successfully! you \n can track the delivery in the order\nsection")
                                .font(Font.custom("Switzer-Regular", size: 14))
                                .multilineTextAlignment(.center)
                                .foregroundStyle(Color.subTextClr)
                                .padding(.horizontal, 16)
                        }
                    }
                    .padding(.bottom, 32)
                    
                    VStack(spacing: 16) {
                        Button {
                            navManager.popToRootWithTab(.home)
                        } label: {
                            VStack {
                                Text("Back Home")
                                    .font(Font.custom("Switzer-Medium", size: 16))
                                    .foregroundStyle(Color.subTextClr)
                                    .frame(maxWidth: .infinity, minHeight: 56, maxHeight: 56)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 14)
                                            .stroke(Color("buttonShapeColor"), lineWidth: 1)
                                    }
                            }
                        }
                        
                        CustomButtonView(action: {
                        }, title: "Track Your Order")
                    }
                    .padding(.bottom, 44)
                    
                    Spacer()
                    
                    Text("You Can Order Somethings Also")
                        .font(Font.custom("Switzer-Regular", size: 14))
                        .foregroundStyle(Color.textClr)
                        .frame(height: 22)
                        .padding(.bottom, 34)
                }
                .padding(.horizontal, 24)
                .presentationDetents([.height(528)])
                .presentationDragIndicator(.hidden)
            //  .interactiveDismissDisabled()
                .ignoresSafeArea(.all, edges: .bottom)
            }
            
            ZStack {
                if isLoading {
                    LottieView(animationName: "App-animation", play: true, loopMode: .loop)
                        .frame(width: 200, height: 200)
                }
            }
            
            VStack {
                if isLoading1 {
                    LottieView(animationName: "paymentLoaders", play: true, loopMode: .loop)
                        .frame(width: 250, height: 250)
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
    VerifyOtpView()
}
