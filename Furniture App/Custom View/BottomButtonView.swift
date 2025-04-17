//
//  BottomButtonView.swift
//  Furniture App
//
//  Created by Owais on 2/20/25.
//

import SwiftUI

struct BottomButtonView: View {
    var price: String = "100"
    @State private var quantity: Int = 0
    
    var body: some View {
        
        VStack(spacing: 0) {
            Spacer()
            VStack(spacing: 0) {
                HStack(spacing: 10) {
                    
                    
                    ProductQuantityButton(quantity: $quantity)
                    
                    
//                    HStack(spacing: 8) {
//                        Button {
//                            quantity -= 1
//                        } label: {
//                            Image(systemName: "minus")
//                                .scaledToFit()
//                                .frame(width: 26, height: 26)
//                                .foregroundColor(Color("subTextClr"))
//                                .background(Color("buttonShapeColor"))
//                                .clipShape(Circle())
//                        }
//                        
//                        Text("\(quantity)")
//                            .font(Font.custom("Switzer-Regular", size: 14))
//                            .foregroundStyle(Color.textClr)
//                        
//                        Button {
//                            quantity += 1
//                        } label: {
//                            Image(systemName: "plus")
//                                .scaledToFit()
//                                .frame(width: 26, height: 26)
//                                .foregroundColor(Color.white)
//                                .background(Color("primaryColor"))
//                                .clipShape(Circle())
//                        }
//                        
//                    }
                    
                    Spacer()
                    
                    Text("Total: \(price)")
                    
                }
                .frame(height: 26)
                .padding(.bottom, 24)
                
                CustomButtonView(action: {
                    //
                }, title: "Add To Cart", isImageVisible: true, imageName: "adt", bgColor: Color("primaryColor"), textColor: .white)
            }
            .padding(.horizontal, 24)
            .padding(.top, 24)
            .padding(.bottom, 12)
            .background(.white)
            .clipShape(RoundedCorner(radius: 24, corners: [.topLeft, .topRight]))
        }
    }
}

#Preview {
    BottomButtonView()
}
