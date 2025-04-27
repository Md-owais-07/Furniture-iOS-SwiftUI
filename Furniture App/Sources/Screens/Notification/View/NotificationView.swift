//
//  NotificationView.swift
//  Furniture App
//
//  Created by Owais on 2/21/25.
//

import SwiftUI

struct NotificationView: View {
    @State private var isNotificationEmpty: Bool = true
    @State private var showNoNotificationsText: Bool = false
    
    @EnvironmentObject var navManager: AppNavigationManager
    
    var body: some View {
        ZStack {
            Color("AppColor").ignoresSafeArea(.all)
            
            VStack(spacing: -25) {
                if isNotificationEmpty {
                    LottieView(animationName: "Notifications", play: true, loopMode: .playOnce)
                        .frame(width: 150, height: 150)
                }
                
                if isNotificationEmpty {
                    if showNoNotificationsText {
                        Text("No notifications found")
                            .font(Font.custom("Switzer-Regular", size: 16))
                            .foregroundStyle(Color.subTextClr)
                            .frame(height: 24)
                    }
                }
            }
            .onAppear {
                if isNotificationEmpty {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        showNoNotificationsText = true
                    }
                }
            }
            
            VStack {
                ZStack {
                    ZStack {
                        Text("Notifications")
                            .font(Font.custom("Switzer-Medium", size: 20))
                            .foregroundStyle(Color.textClr)
                    }
                    
                    HStack {
                        TopCircularButtonView(action: {
                            navManager.pop()
                        }, imageName: "backBtn")
                        
                        Spacer()
                        
                        if !isNotificationEmpty {
                            Button {
                                //
                            } label: {
                                Text("Clear All")
                                    .font(Font.custom("Switzer-Regular", size: 16))
                                    .foregroundStyle(Color.subTextClr)
                            }
                        }
                    }
                }
                .padding(.top, 8)
                .frame(height: 48)
                
                Spacer()
                
                ScrollView {
                    //
                }
                
            }
            .padding(.horizontal, 24)
            .navigationBarBackButtonHidden(true)
            .background(EnableSwipeBackGesture())
        }
    }
}

#Preview {
    NotificationView()
}
