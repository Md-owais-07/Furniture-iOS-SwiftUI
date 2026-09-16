//
//  AddressView.swift
//  Furniture App
//
//  Created by Owais on 4/21/25.
//

import SwiftUI

struct AddressView: View {
    
    let data: AddressModel
    let isSelected: Bool
    
    @Binding var isEdit: Bool
    
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                VStack {
                    HStack(spacing: 16) {
                        HStack {
                            Image(isSelected ? "check" : "uncheck")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                        }
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(data.title)
                                .font(Font.custom("Switzer-Medium", size: 16))
                                .foregroundStyle(Color.textClr)
                            Text(data.number)
                                .font(Font.custom("Switzer-Regular", size: 13))
                                .foregroundStyle(Color.subTextClr)
                            Text(data.address)
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
            .frame(maxWidth: .infinity, maxHeight: 100)
            .background(Color.white)
            .cornerRadius(16)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    AddressView(data: addressData[0], isSelected: true, isEdit: .constant(true), action: {})
}
