//
//  LoginView.swift
//  ListenToSeniorApp
//
//  Created by MAC0013 on 16/10/24.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email : String = ""
    @State private var Password : String = ""
    
    var body: some View {
        ZStack {
            
            Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        
            VStack(alignment:.center,spacing: 12){
                                
                Image("ltslogo")
                
                Text("Welcome To Listen to Senior")
                    .foregroundColor(.white)
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                
                Text("Enter Your Email Password to Get Started")
                    .foregroundColor(.gray)
                    .font(.system(size: 18))
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                
                
                VStack(spacing: 20){
                                        
                    CustomTextField(
                        txtController: $email,
                        hintText: .constant("Enter Your Email"),
                        headerText: .constant("Email"),
                        passwordIconView: AnyView(
                            Text("")
                        )
                    )
                    
                    CustomTextField(
                        txtController: $Password,
                        hintText: .constant("Enter Your Password"),
                        headerText: .constant("Password"),
                        passwordIconView: AnyView(
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Image(systemName: "eye")
                                 .foregroundColor(.gray)
                            })
                            .padding(.trailing, 8)
                        )
                    )
                
                }
                .padding(.horizontal, 20)
                
                    Text("Forgot Password")
                        .foregroundColor(.white)
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .trailing)
                        .padding(.trailing, 20)
                        .padding(.bottom, 20)
                
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Login")
                        .foregroundColor(.white)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.all, 20)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .background(.orange.opacity(0.9))
                    .clipShape(.rect(cornerRadius: 14))
                    .padding(.horizontal)
                })
                
                
                HStack {
                    Text("Don’t have an account?")
                        .foregroundColor(.white)
                        .font(.system(size: 18))
                    .fontWeight(.bold)
                    Text("Sign Up")
                        .foregroundColor(.orange)
                        .font(.system(size: 18))
                    .fontWeight(.bold)
                }
                .padding(.vertical,12)
            }
    
        }
    }
}

#Preview {
    LoginView()
}
