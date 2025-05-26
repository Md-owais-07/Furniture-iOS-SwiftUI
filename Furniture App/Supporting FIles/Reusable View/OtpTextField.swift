//
//  OtpTextField.swift
//  Furniture App
//
//  Created by Owais on 4/28/25.
//

import SwiftUI

//struct OtpTextField: View {
//    @Binding var otp: String
//    
//    var body: some View {
//        VStack {
//            HStack(spacing: 20) {
//                VStack(alignment: .center, spacing: 8) {
//                    TextField(text: $otp) {
//                        Text("")
//                    }.padding(.leading, 8).frame(width: 32, height: 25, alignment: .center).font(.system(size: 22, weight: .semibold)).foregroundStyle(Color("primaryColor"))
//                    
//                    Rectangle()
//                        .frame(width: 34, height: 2.5).foregroundStyle(Color("primaryColor"))
//                }
//            }
//        }
//    }
//}


struct OtpTextField: View {
    @Binding var otp: [String] // Should be an array of 4 strings, one for each digit
    @FocusState private var focusedIndex: Int?

    var body: some View {
        HStack(spacing: 20) {
            ForEach(0..<4, id: \.self) { index in
                VStack(spacing: 8) {
                    TextField("", text: Binding(
                        get: { otp[index] ?? "" },
                        set: { newValue in
                            if newValue.count <= 1 {
                                otp[index] = newValue
                                if !newValue.isEmpty && index < 3 {
                                    focusedIndex = index + 1
                                }
                            }
                        })
                    )
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.center)
                    .focused($focusedIndex, equals: index)
                    .frame(width: 40, height: 40)
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundStyle(Color("primaryColor"))
                    .background(Color.white)
                    .cornerRadius(6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color("primaryColor"), lineWidth: 2.5)
                    )
                }
            }
        }
        .onAppear {
            focusedIndex = 0
        }
    }
}


#Preview {
    OtpTextField(otp: .constant([]))
}




//                VStack(alignment: .center, spacing: 8) {
//                    TextField(text: $otp) {
//                        Text("")
//                    }.padding(.leading, 8).frame(width: 32, height: 25, alignment: .center).font(.system(size: 22, weight: .semibold)).foregroundStyle(Color("primaryColor"))
//
//                    Rectangle()
//                        .frame(width: 34, height: 2.5).foregroundStyle(Color("primaryColor"))
//                }
//
//                VStack(alignment: .center, spacing: 8) {
//                    TextField(text: $otp) {
//                        Text("")
//                    }.padding(.leading, 8).frame(width: 32, height: 25, alignment: .center).font(.system(size: 22, weight: .semibold)).foregroundStyle(Color("primaryColor"))
//
//                    Rectangle()
//                        .frame(width: 34, height: 2.5).foregroundStyle(Color("primaryColor"))
//                }
//
//                VStack(alignment: .center, spacing: 8) {
//                    TextField(text: $otp) {
//                        Text("")
//                    }.padding(.leading, 8).frame(width: 32, height: 25, alignment: .center).font(.system(size: 22, weight: .semibold)).foregroundStyle(Color("primaryColor"))
//
//                    Rectangle()
//                        .frame(width: 34, height: 2.5).foregroundStyle(Color("primaryColor"))
//                }
