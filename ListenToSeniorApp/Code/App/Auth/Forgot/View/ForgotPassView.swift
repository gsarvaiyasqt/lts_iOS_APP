//
//  ForgotPassView.swift
//  ListenToSeniorApp
//
//  Created by MAC0013 on 16/10/24.
//

import SwiftUI

struct ForgotPassView: View {
    
    @State private var email : String = ""

    
    var body: some View {
        ZStack {
            
            Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        
            VStack(alignment:.center,spacing: 12){
                                
                Image("ltslogo")
                
                Text("Forgot Password?")
                    .foregroundColor(.white)
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                
                Text("Enter your email to reset it. Check your inbox for a link to create a new password.")
                    .foregroundColor(.gray)
                    .font(.system(size: 18))
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                
                
     
                                        
                    CustomTextField(
                        txtController: $email,
                        hintText: .constant("Enter Your Email"),
                        headerText: .constant("Email"),
                        passwordIconView: AnyView(
                            Text("")
                        )
                    )
                    .padding(.horizontal,20)
                    .padding(.bottom,10)
                
            
             
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Forgot")
                        .foregroundColor(.white)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.all, 20)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .background(.orange.opacity(0.9))
                    .clipShape(.rect(cornerRadius: 14))
                    .padding(.horizontal)
                })
                
                
//                HStack {
//                    Text("Sign Up")
//                        .foregroundColor(.orange)
//                        .font(.system(size: 18))
//                    .fontWeight(.bold)
//                }
//                .padding(.vertical,12)
            }
    
        }
    }
}

#Preview {
    ForgotPassView()
}
