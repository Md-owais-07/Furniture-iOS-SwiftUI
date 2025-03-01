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
    
    var body: some View {
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
                        if emailField.count == 0 || passwordField.count == 0 || fullNameField.count == 0 {
                            print("All fields are required")
                        } else if !emailField.contains("@") {
                            print("Enter valid email")
                        } else if passwordField.count < 6 {
                            print("Password should be atleast 6 characters")
                        } else {
                            viewModel.createUser(email: emailField, password: passwordField)
                            sessionManager.isLoggedIn = true
                            sessionManager.userName = fullNameField
                            sessionManager.userEmail = emailField
                        }
                        
                    }, title: "Sign Up")
                    
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
            .navigationBarBackButtonHidden(true)
            .padding(.horizontal, 24)
        }
    }
}

#Preview {
    RegisterView()
}
