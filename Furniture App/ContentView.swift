//
//  ContentView.swift
//  Furniture App
//
//  Created by Owais on 1/25/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isNavigate: Bool = false
    @State private var currentPage = 0
    let pageCount = 3
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    
    
    var body: some View {
        NavigationStack() {
            VStack {
                TabView(selection: $currentPage) {
                    OnboardView(imageName: "Sofa", title: "View And Exprience Furniture With The Help Of Augmented Reality").tag(0)
                    OnboardView(imageName: "Sofa", title: "Find the perfect furniture for your space").tag(1)
                    OnboardView(imageName: "Sofa", title: "Get started with our app today").tag(2)
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
                            isNavigate = true
                            hasSeenOnboarding = true
                        }, title: "Get Started")
                        .navigationDestination(isPresented: $isNavigate) {
                            LoginView()
                        }
                    }
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 8)
            }
        }
    }
}


#Preview {
    ContentView()
}
