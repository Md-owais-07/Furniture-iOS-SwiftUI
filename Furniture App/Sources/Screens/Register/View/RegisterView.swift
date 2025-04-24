//
//  RegisterView.swift
//  Furniture App
//
//  Created by Owais on 1/27/25.
//

import SwiftUI

struct RegisterView: View {
    @State private var fullNameField: String = ""
    @State private var emailField: String = ""
    @State private var passwordField: String = ""
    @StateObject private var viewModel = RegisterViewModel()
    @Environment(\.dismiss) private var dismiss
    
    @EnvironmentObject var sessionManager: UserSessionManager
    @EnvironmentObject var navManager: AppNavigationManager
    
    @State private var toast: Toast? = nil
    @State private var isLoading: Bool = false
    @State private var isNavigating: Bool = false
    
    var body: some View {
        ZStack {
            Color("AppColor").ignoresSafeArea(.all)
            
            VStack {
                HStack {
                    TopCircularButtonView(action: {
                        dismiss()
                    }, imageName: "backBtn")
                    Spacer()
                }
                .padding(.top, 10)
                .padding(.bottom, 32)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Create Account")
                        .font(.system(size: 32, weight: .semibold, design: .serif))
                        .foregroundStyle(.textClr)
                    
                    Text("Let’s create account toghter")
                        .font(.system(size: 16, weight: .regular, design: .serif))
                        .foregroundStyle(Color("subTextClr"))
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 32)
                
                VStack(spacing: 16) {
                    CustomTextFieldView(title: "Full Name", placeholder: "Enter Your Name", text: $fullNameField)
                    CustomTextFieldView(title: "Email", placeholder: "Enter Your Email", text: $emailField)
                    CustomTextFieldView(title: "Password", placeholder: "••••••••", text: $passwordField, isSecure: true)
                }
                .padding(.bottom, 24)
                
                VStack(spacing: 16) {
                    CustomButtonView(action: {
                        if emailField.isEmpty || passwordField.isEmpty || fullNameField.isEmpty {
                            print("All fields are required")
                            toast = Toast(style: .error, message: "All fields are required")
                        } else if !emailField.contains("@") {
                            print("Enter valid email")
                            toast = Toast(style: .error, message: "Enter valid email")
                        } else if passwordField.count < 6 {
                            print("Password should be atleast 6 characters")
                            toast = Toast(style: .error, message: "Password should be atleast 6 characters")
                        } else {
                            isLoading = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                toast = Toast(style: .success, message: "Register Successful")
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                viewModel.createUser(email: emailField, password: passwordField)
                                sessionManager.isLoggedIn = true
                                isNavigating = true
                                sessionManager.userName = fullNameField
                                sessionManager.userEmail = emailField
                                isLoading = false
                            }
                        }
                        
                    }, title: "Sign Up")
                    .navigationDestination(isPresented: $isNavigating) {
                        CustomTabBarView()
                    }
                    
                    CustomButtonView(action: {
                        //
                    }, title: "Sign In With Google", isImageVisible: true, imageName: "Google", bgColor: .white, textColor: .textClr)
                }
                .padding(.bottom, 24)
                
                
                HStack {
                    Text("Already have an account?")
                        .font(.system(size: 14, weight: .regular, design: .default))
                        .foregroundStyle(Color.subTextClr)
                    Button {
                        dismiss()
                    } label: {
                        Text("Sign In")
                            .font(.system(size: 14, weight: .medium, design: .default))
                            .foregroundStyle(Color("textClr"))
                    }
                }
                Spacer()
            }
            .toastView(toast: $toast)
            .navigationBarBackButtonHidden(true)
            .background(EnableSwipeBackGesture())
            .padding(.horizontal, 24)
            
            ZStack {
                if isLoading {
                    LottieView(animationName: "App-animation", play: true, loopMode: .loop)
                        .frame(width: 200, height: 200)
                }
            }
        }
    }
}

#Preview {
    RegisterView()
}
