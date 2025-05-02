//
//  RegisterView.swift
//  Furniture App
//
//  Created by Owais on 1/27/25.
//

import SwiftUI
import FirebaseAuth

struct RegisterView: View {
    @StateObject private var viewModel = RegisterViewModel()
    
    @EnvironmentObject var sessionManager: UserSessionManager
    @EnvironmentObject var navManager: AppNavigationManager
    
    @State private var toast: Toast? = nil
    
    var body: some View {
        ZStack {
            Color("AppColor").ignoresSafeArea(.all)
            
            VStack {
                HStack {
                    TopCircularButtonView(action: {
                        navManager.pop()
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
                    CustomTextFieldView(title: "Full Name", placeholder: "Enter Your Name", text: $viewModel.fullNameField).keyboardType(.default)
                    CustomTextFieldView(title: "Email", placeholder: "Enter Your Email", text: $viewModel.emailField).keyboardType(.emailAddress)
                    CustomTextFieldView(title: "Password", placeholder: "••••••••", text: $viewModel.passwordField, isSecure: true).keyboardType(.asciiCapable)
                }
                .padding(.bottom, 24)
                
                VStack(spacing: 16) {
                    CustomButtonView(action: {
                        if viewModel.emailField.isEmpty || viewModel.passwordField.isEmpty || viewModel.fullNameField.isEmpty {
                            print("All fields are required")
                            toast = Toast(style: .error, message: "All fields are required")
                        } else if !viewModel.emailField.contains("@") {
                            print("Enter valid email")
                            toast = Toast(style: .error, message: "Enter valid email")
                        } else if viewModel.passwordField.count < 6 {
                            print("Password should be atleast 6 characters")
                            toast = Toast(style: .error, message: "Password should be atleast 6 characters")
                        } else {
                            viewModel.isLoading = true
                            
                            viewModel.createUser(email: viewModel.emailField, password: viewModel.passwordField) { result in
                                if result {
                                    toast = Toast(style: .success, message: "Register Successful")
                                    if let uid = Auth.auth().currentUser?.uid {
                                        viewModel.createUserProfile(uid: uid, fullName: viewModel.fullNameField, email: viewModel.emailField) { profileSucces in
                                            DispatchQueue.main.async {
                                                viewModel.isLoading = false
                                                if profileSucces {
                                                    navManager.popToRoot()
                                                    sessionManager.isLoggedIn = true
                                                    sessionManager.userName = viewModel.fullNameField
                                                    sessionManager.userEmail = viewModel.emailField
                                                } else {
                                                    toast = Toast(style: .error, message: "Failed to save user profile.")
                                                }
                                            }
                                        }
                                    } else {
                                        viewModel.isLoading = false
                                        toast = Toast(style: .error, message: "Could not retrieve user ID.")
                                    }
                                } else {
                                    DispatchQueue.main.async {
                                        viewModel.isLoading = false
                                        if let errorMessage = viewModel.errorMessage {
                                            toast = Toast(style: .error, message: errorMessage)
                                        } else {
                                            toast = Toast(style: .error, message: "Something went wrong.")
                                        }
                                    }
                                }
                            }
                        }
                    }, title: "Sign Up")
                    
                    CustomButtonView(action: {
                        //
                    }, title: "Sign Un With Google", isImageVisible: true, imageName: "Google", bgColor: .white, textColor: .textClr)
                }
                .padding(.bottom, 24)
    
                
                HStack {
                    Text("Already have an account?")
                        .font(.system(size: 14, weight: .regular, design: .default))
                        .foregroundStyle(Color.subTextClr)
                    Button {
                        navManager.pop()
                    } label: {
                        Text("Sign In")
                            .font(.system(size: 14, weight: .medium, design: .default))
                            .foregroundStyle(Color("textClr"))
                    }
                }
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
            .background(EnableSwipeBackGesture())
            .padding(.horizontal, 24)
            
            ZStack {
                if viewModel.isLoading {
                    LottieView(animationName: "App-animation", play: true, loopMode: .loop)
                        .frame(width: 200, height: 200)
                }
            }
        }
        .toastView(toast: $toast)
    }
}

#Preview {
    RegisterView()
}
