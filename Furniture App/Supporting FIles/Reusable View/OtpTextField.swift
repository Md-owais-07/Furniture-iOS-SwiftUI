//
//  OtpTextField.swift
//  Furniture App
//
//  Created by Owais on 4/28/25.
//

import SwiftUI

struct OtpTextField: View {
    @Binding var otp: String
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                VStack(alignment: .center, spacing: 8) {
                    TextField(text: $otp) {
                        Text("")
                    }.padding(.leading, 8).frame(width: 32, height: 25, alignment: .center).font(.system(size: 22, weight: .semibold)).foregroundStyle(Color("primaryColor"))
                    
                    Rectangle()
                        .frame(width: 34, height: 2.5).foregroundStyle(Color("primaryColor"))
                }
                
                VStack(alignment: .center, spacing: 8) {
                    TextField(text: $otp) {
                        Text("")
                    }.padding(.leading, 8).frame(width: 32, height: 25, alignment: .center).font(.system(size: 22, weight: .semibold)).foregroundStyle(Color("primaryColor"))
                    
                    Rectangle()
                        .frame(width: 34, height: 2.5).foregroundStyle(Color("primaryColor"))
                }
                
                VStack(alignment: .center, spacing: 8) {
                    TextField(text: $otp) {
                        Text("")
                    }.padding(.leading, 8).frame(width: 32, height: 25, alignment: .center).font(.system(size: 22, weight: .semibold)).foregroundStyle(Color("primaryColor"))
                    
                    Rectangle()
                        .frame(width: 34, height: 2.5).foregroundStyle(Color("primaryColor"))
                }
                
                VStack(alignment: .center, spacing: 8) {
                    TextField(text: $otp) {
                        Text("")
                    }.padding(.leading, 8).frame(width: 32, height: 25, alignment: .center).font(.system(size: 22, weight: .semibold)).foregroundStyle(Color("primaryColor"))
                    
                    Rectangle()
                        .frame(width: 34, height: 2.5).foregroundStyle(Color("primaryColor"))
                }
                
            }
        }
    }
}

#Preview {
    OtpTextField(otp: .constant(""))
}
