//
//  LoginView.swift
//  Furniture App
//
//  Created by Owais on 1/25/25.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @State private var emailField: String = "t1@gmail.com"
    @State private var passwordField: String = "abcd12"
    @State private var isNavigating = false
    @State private var isLoading: Bool = false
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    @StateObject private var viewModel = LoginViewModel()
    @State private var toast: Toast? = nil
    
    var body: some View {
        NavigationStack() {
            ZStack {
                Color("AppColor").ignoresSafeArea(.all)
                
                if isLoading {
                    LottieView(animationName: "App-animation", play: true, loopMode: .loop)
                        .frame(width: 200, height: 200)
                }
                
                VStack {
                    
//                    HStack {
//                        TopCircularButtonView(action: {
//                            //
//                        }, imageName: "backBtn")
//                        Spacer()
//                    }
//                    .padding(.top, 10)
//                    .padding(.bottom, 32)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Welcome Back")
                            .font(.system(size: 32, weight: .semibold, design: .serif))
                            .foregroundStyle(.textClr)
                        
                        Text("Welcome Back! Please Enter Your Details.")
                            .font(.system(size: 16, weight: .regular, design: .serif))
                            .foregroundStyle(Color("subTextClr"))
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 32)
                    .padding(.top, 98)
                    
                    VStack(spacing: 16) {
                        CustomTextFieldView(title: "Email", placeholder: "Enter Your Email", text: $emailField)
                        CustomTextFieldView(title: "Password", placeholder: "••••••••", text: $passwordField, isSecure: true)
                    }
                    .padding(.bottom, 16)
                    
                    
                    HStack(spacing: 8) {
                        Button {
                            //
                        } label: {
                            Image("rect")
                                .resizable()
                                .frame(width: 16, height: 16)
                        }
                        
                        Text("Remember For 30 Days")
                            .font(.system(size: 14, weight: .regular, design: .default))
                            .foregroundStyle(Color("subTextClr"))
                        
                        Spacer()
                        
                        Button {
                            //
                        } label: {
                            Text("Forgot Password")
                                .font(.system(size: 14, weight: .regular, design: .default))
                                .foregroundStyle(.textClr)
                        }
                        
                    }
                    .padding(.bottom, 24)
                    
                    VStack(spacing: 16) {
                            CustomButtonView(action: {
                                if emailField.isEmpty || passwordField.isEmpty {
                                    print("Email and Password fields are required")
                                    toast = Toast(style: .error, message: "Email and Password fields are required")
                                } else if !emailField.contains("@") {
                                    print("Enter valid email")
                                    toast = Toast(style: .error, message: "Enter valid email address")
                                } else if passwordField.count < 6 {
                                    print("Password should be atleast 6 characters")
                                    toast = Toast(style: .error, message: "Password should be atleast 6 characters")
                                } else {
                                    isLoading = true
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                        toast = Toast(style: .success, message: "Login Successful")
                                        viewModel.loginWithFirebase(email: emailField, password: passwordField) { result in
                                            if result {
                                                isLoading = false
                                                isLoggedIn = true
                                                isNavigating = true
                                            }
                                        }
                                    }
                                }
                            }, title: "Sign In")
                            .navigationDestination(isPresented: $isNavigating) {
                                CustomTabBarView()
                            }
                        
                        Button {
                            //
                        } label: {
                            CustomButtonView(action: {
                                //
                            }, title: "Sign In With Google", isImageVisible: true, imageName: "Google", bgColor: .white, textColor: .textClr)
                        }
                    }
                    .padding(.bottom, 24)
                    
                    HStack {
                        Text("Don't Have An Account?")
                            .font(.system(size: 14, weight: .regular, design: .default))
                            .foregroundStyle(Color("subTextClr"))
                        
                        Button {
                            //
                        } label: {
                            NavigationLink(destination: RegisterView()) {
                                Text("Sign Up For Free")
                                    .font(.system(size: 14, weight: .medium, design: .default))
                                    .foregroundStyle(Color("textClr"))
                            }
                        }
                    }
                    Spacer()
                }
                .navigationBarBackButtonHidden(true)
                .background(EnableSwipeBackGesture())
                .padding(.horizontal, 24)
            
            }
            .toastView(toast: $toast)
        }
    }
}

#Preview {
    LoginView()
}

