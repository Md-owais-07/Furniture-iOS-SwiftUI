//
//  NotificationView.swift
//  Furniture App
//
//  Created by Owais on 2/21/25.
//

import SwiftUI

struct NotificationView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color("AppColor").ignoresSafeArea(.all)
            
            VStack {
                
                ZStack {
                    
                    ZStack {
                        Text("Notifications")
                            .font(Font.custom("Switzer-Medium", size: 20))
                            .foregroundStyle(Color.textClr)
                    }
                    
                    HStack {
                        TopCircularButtonView(action: {
                            dismiss()
                        }, imageName: "backBtn")
                        Spacer()
                        Button {
                            
                        } label: {
                            Text("Clear All")
                                .font(Font.custom("Switzer-Regular", size: 16))
                                .foregroundStyle(Color.subTextClr)
                        }
                    }
                    
                    
                }
                .padding(.top, 8)
                .frame(height: 48)
                
                Spacer()
                
                ScrollView {
                    
                }
                
            }
            .padding(.horizontal, 24)
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    NotificationView()
}
