//
//  AddressView.swift
//  Furniture App
//
//  Created by Owais on 4/21/25.
//

import SwiftUI

struct AddressView: View {
    var action: () -> Void
    var image: String = ""
    var title: String = ""
    var phoneNumber: String = ""
    var address: String = ""
    
    @Binding var isEdit: Bool
    
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                VStack {
                    HStack(spacing: 16) {
                        HStack {
                            Image(image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                        }
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(title)
                                .font(Font.custom("Switzer-Medium", size: 16))
                                .foregroundStyle(Color.textClr)
                            Text(phoneNumber)
                                .font(Font.custom("Switzer-Regular", size: 13))
                                .foregroundStyle(Color.subTextClr)
                            Text(address)
                                .font(Font.custom("Switzer-Regular", size: 13))
                                .foregroundStyle(Color.subTextClr)
                        }
                    }
                }
                .padding(.vertical, 16)
                .padding(.leading, 16)
                
                Spacer()
                
                if isEdit {
                    HStack {
                        Button {
                            action()
                        } label: {
                            Image("edit")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                        }
                        .padding(.trailing, 16)
                    }
                }
                
                
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: 100)
        .background(Color.white)
        .cornerRadius(16)
    }
}

#Preview {
    AddressView(action: {
        print("helo")
    }, isEdit: .constant(true))
}
