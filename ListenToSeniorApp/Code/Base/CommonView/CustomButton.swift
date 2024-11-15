//
//  CustomButton.swift
//  ListenToSeniorApp
//
//  Created by MAC0013 on 05/11/24.
//

import SwiftUI

struct CustomButton: View {
    var btnTxt : String = "Button"
    let OnTap : () async -> Void
    @Binding var isLoding : Bool
    
    var body: some View {
        Button(action: {
            Task{
                isLoding = true
                await OnTap()
                isLoding = false
            }
        }, label: {
            if isLoding != true{
                Text(btnTxt)
                    .foregroundColor(.white)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.all, 16)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .background(.orange.opacity(0.9))
                    .clipShape(.rect(cornerRadius: 14))
            }else{
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .frame(maxWidth: .infinity)
                    .padding(.all, 16)
                    .background(.orange.opacity(0.9))
                    .clipShape(RoundedRectangle(cornerRadius: 14))
            }
        
                
        })
    }
}

#Preview {
    CustomButton(OnTap: {}, isLoding: .constant(false))
}
