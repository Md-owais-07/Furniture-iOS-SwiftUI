//
//  LoginView.swift
//  Furniture App
//
//  Created by Owais on 1/25/25.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    @State private var toast: Toast? = nil
    
    @EnvironmentObject var sessionManager: UserSessionManager
    @EnvironmentObject var navManager: AppNavigationManager
    
    var body: some View {
        ZStack {
            Color("AppColor").ignoresSafeArea(.all)
            
            VStack(spacing: 0) {
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
                    CustomTextFieldView(title: "Email", placeholder: "Enter Your Email", text: $viewModel.emailField).keyboardType(.emailAddress)
                    CustomTextFieldView(title: "Password", placeholder: "••••••••", text: $viewModel.passwordField, isSecure: true).keyboardType(.asciiCapable)
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
                        if viewModel.emailField.isEmpty || viewModel.passwordField.isEmpty {
                            print("Email and Password fields are required")
                            toast = Toast(style: .error, message: "Email and Password fields are required")
                        } else if !viewModel.emailField.contains("@") {
                            print("Enter valid email")
                            toast = Toast(style: .error, message: "Enter valid email address")
                        } else if viewModel.passwordField.count < 6 {
                            print("Password should be atleast 6 characters")
                            toast = Toast(style: .error, message: "Password should be atleast 6 characters")
                        } else {
                            viewModel.isLoading = true
                            
                            viewModel.loginWithFirebase(email: viewModel.emailField, password: viewModel.passwordField) { result in
                                viewModel.isLoading = false
                                if result {
                                    print("LOGIN ONE SUCCESS")
                                    toast = Toast(style: .success, message: "Login Successful")
                                    
                                    if let uid = Auth.auth().currentUser?.uid {
                                        print("GET CURRECT USER ID: \(uid)")
                                        
                                        viewModel.fetchUserProfile(uid: uid) { userProfile in
                                            print("USER PROFILE FETCH SUCCESS")
                                            DispatchQueue.main.async {
                                                
                                                viewModel.isLoading = false
                                                if let profile = userProfile {
                                                    sessionManager.isLoggedIn = true
                                                    sessionManager.userName = profile.fullName
                                                    sessionManager.userEmail = profile.email
                                                } else {
                                                    print("Failed to fetch profile")
                                                }
                                            }
                                        }
                                    } else {
                                        print("Failed to fetch user id")
                                    }
                                } else {
                                    print("LOGIN ONE FAILED")
                                    toast = Toast(style: .error, message: viewModel.errorMessage ?? "Login failed")
                                }
                            }
                        }
                    }, title: "Log In")
                    
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
                        navManager.push(.auth(.signUp))
                    } label: {
                        Text("Sign Up For Free")
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
    LoginView()
}

