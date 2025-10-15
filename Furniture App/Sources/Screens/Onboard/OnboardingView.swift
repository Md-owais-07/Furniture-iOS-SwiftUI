//
//  ContentView.swift
//  Furniture App
//
//  Created by Owais on 1/25/25.
//

import SwiftUI

struct OnboardingView: View {
    @State private var isNavigate: Bool = false
    @State private var currentPage = 0
    
    @EnvironmentObject var sessionManager: UserSessionManager
    @EnvironmentObject var navManager: AppNavigationManager
    
    let pageCount = 3
    
    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                OnboardView(imageName: "on-1", title: "View And Exprience Furniture With The Help Of Augmented Reality").tag(0)
                OnboardView(imageName: "on-2", title: "Find the perfect furniture for your space").tag(1)
                OnboardView(imageName: "on-3", title: "Get started with our app today").tag(2)
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(.page(backgroundDisplayMode: .never))
            .onAppear {
                UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(named: "primaryColor")
                UIPageControl.appearance().pageIndicatorTintColor = UIColor.systemGray.withAlphaComponent(0.5)
                UIPageControl.appearance().backgroundColor = UIColor.white
            }
            
            HStack {
                if currentPage < pageCount - 1 {
                    Button {
                        print("Skip pressed")
                        currentPage = pageCount
                    } label: {
                        Text("Skip")
                            .foregroundStyle(Color("subTextClr"))
                            .font(.system(size: 16, weight: .regular, design: .serif))
                    }
                }
                
                Spacer()
                
                if currentPage < pageCount - 1 {
                    Button {
                        currentPage += 1
                    } label: {
                        Image("btnNext")
                    }
                } else {
                    CustomButtonView(action: {
                        withAnimation {
                            sessionManager.hasSeenOnboarding = true
                        }
                    }, title: "Get Started")
                }
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 8)
        }
    }
}


#Preview {
    OnboardingView()
}
