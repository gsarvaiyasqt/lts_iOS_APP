//
//  CustomTextField.swift
//  ListenToSeniorApp
//
//  Created by MAC0013 on 16/10/24.
//

import SwiftUI

struct CustomTextField: View {
    
    @Binding var txtController : String
    @Binding var hintText : String
    @Binding var headerText : String
    var passwordIconView :  AnyView?
    
    var body: some View {
        VStack(alignment:.leading){
            
            Text(headerText)
                .foregroundColor(.white)
                .font(.system(size: 18))
                .fontWeight(.bold)
            
            HStack {
                
                ZStack(alignment:.leading) {
                    if(txtController.isEmpty){
                        Text(hintText.isEmpty ? "Enter Your Hintext" : "\(hintText)")
                            .foregroundColor(.gray)
                            .padding(.leading, 15)
                            
                    }
                    TextField("",text: $txtController)
                        .textContentType(.none)
                        .foregroundColor(.white)
                    .padding()
                }
                
                passwordIconView
                
            }
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))  // Optional: Adds a border to the field
        }
    }
}

#Preview {
    CustomTextField(
        txtController: .constant(""),
        hintText: .constant(""),
        headerText: .constant(""),
        passwordIconView: AnyView(
            Text("")
        )
    )
}
