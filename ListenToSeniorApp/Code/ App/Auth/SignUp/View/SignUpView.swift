//
//  SignUpPage.swift
//  ListenToSeniorApp
//
//  Created by MAC0013 on 16/10/24.
//

import SwiftUI

struct SignUpPage: View {
    
    @State private var firstName : String = ""
    @State private var lastName : String = ""
    @State private var email : String = ""
    @State private var phoneNo : String = ""
    @State private var Password : String = ""
    @State private var isCheck : Bool = false
    
    var body: some View {
            ZStack {
                
                Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                            
                ScrollView(showsIndicators: false) {
                    VStack(alignment:.center,spacing: 12){
                                        
                        Image("ltslogo")
                        
                        Text("Welcome To Listen to Senior")
                            .foregroundColor(.white)
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                        
                        Text("Start by creating your free account.")
                            .foregroundColor(.gray)
                            .font(.system(size: 18))
                            .fontWeight(.medium)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 40)
                            .padding(.bottom)
                        
                        
                        VStack(spacing: 20){
                                                
                            CustomTextField(
                                txtController: $firstName,
                                hintText: .constant("Enter Your FirstName"),
                                headerText: .constant("FirstName"),
                                passwordIconView: AnyView(
                                    Text("")
                                )
                            )
                            
                            CustomTextField(
                                txtController: $lastName,
                                hintText: .constant("Enter Your LastName"),
                                headerText: .constant("LastName"),
                                passwordIconView: AnyView(
                                    Text("")
                                )
                            )
                            
                            CustomTextField(
                                txtController: $email,
                                hintText: .constant("Enter Your Email"),
                                headerText: .constant("Email Id"),
                                passwordIconView: AnyView(
                                    Text("")
                                )
                            )
                            
                            
                            CustomTextField(
                                txtController: $phoneNo,
                                hintText: .constant("Enter Your Phone No"),
                                headerText: .constant("Phone No"),
                                passwordIconView: AnyView(
                                    Text("")
                                )
                            )
                        
                        }
                        .padding(.horizontal, 20)
                        
                        HStack(alignment:.top) {
                            
                            Button(action: {
                                isCheck.toggle()
                            },label: {
                                CustomCheckBox(checked: $isCheck)
                               }
                            )
                            
                            Spacer(minLength: 10)
                            
                            
                            Text("Please accept **privacy-policy** for signup.")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18))
//                                    .fontWeight(.medium)
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                                    .padding(.trailing, 20)

                        }
                      .padding(.horizontal, 20)
                      .padding(.vertical, 20)
                        
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Sign Up")
                                .foregroundColor(.white)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .padding(.all, 20)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .background(.orange.opacity(0.9))
                            .clipShape(.rect(cornerRadius: 14))
                            .padding(.horizontal)
                        })
                        
                        
                        HStack {
                            Text("Already have an account?")
                                .foregroundColor(.white)
                                .font(.system(size: 18))
                            .fontWeight(.bold)
                            Text("Sign In")
                                .foregroundColor(.orange)
                                .font(.system(size: 18))
                            .fontWeight(.bold)
                        }
                        .padding(.vertical,12)
                    }
                }
        
            }
        }
    }

#Preview {
    SignUpPage()
}
