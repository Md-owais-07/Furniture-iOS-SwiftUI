//
//  LoginView.swift
//  Furniture App
//
//  Created by Owais on 1/25/25.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @State private var emailField: String = ""
    @State private var passwordField: String = ""
    @State private var isNavigating = false
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack() {
            ZStack {
                Color("AppColor").ignoresSafeArea(.all)
                
                VStack {
                    
                    HStack {
                        TopCircularButtonView(action: {
                            //
                        }, imageName: "backBtn")
                        Spacer()
                    }
                    .padding(.top, 10)
                    .padding(.bottom, 32)
                    
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
                                } else if !emailField.contains("@") {
                                    print("Enter valid email")
                                } else if passwordField.count < 6 {
                                    print("Password should be atleast 6 characters")
                                } else {
                                    viewModel.loginWithFirebase(email: emailField, password: passwordField) { result in
                                        if result {
                                            isLoggedIn = true
                                            isNavigating = true
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
                .padding(.horizontal, 24)
            
            }
        }
    }
}

#Preview {
    LoginView()
}

