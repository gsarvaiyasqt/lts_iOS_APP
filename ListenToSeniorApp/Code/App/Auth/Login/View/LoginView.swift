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
    @EnvironmentObject var route: Route
    @EnvironmentObject  var model : LeandingModel
    @StateObject private var loginViewModel = LoginViewModelFactory.createTaskViewModel()
    
    
    var body: some View {
        ZStack(alignment:.center) {
            
            Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            ScrollView(showsIndicators: false) {
                
                VStack(spacing: 12){
                    Spacer()
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
                    
                    
                    Button(action: {
                        route.navigate(to: .forgotPage)
                    }, label: {
                        Text("Forgot Password")
                            .foregroundColor(.white)
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .padding(.trailing, 20)
                            .padding(.bottom, 20)
                    })
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .trailing)
                    
                    
                
                    CustomButton(
                        btnTxt: "Login",
                        OnTap: {
                            Task{
                                
                                if(email.isEmpty){
                                    loginViewModel.shouldShowAlert = true
                                    loginViewModel.loginError = APIError.errorMessage("UserName is Not available")
                                    return
                                }
                                
                                if(Password.isEmpty){
                                    loginViewModel.shouldShowAlert = true
                                    loginViewModel.loginError = APIError.errorMessage("Password is Not available")
                                    return
                                }
                                
                                do{
                                    await loginViewModel.signIn(
                                        loginReqModel:
                                            LoginReqModel(username: email, password: Password)
                                    )
                                    
                                    route.navigateToRoot()
                                    model.isLogin = true
                                    model.isGuest = true
                                    
                                }catch (let error){
                                    print("\(error)")
                                }
                            }
                       
                        },
                        isLoding: $loginViewModel.isLoading
                    )
                    .padding(.horizontal)
                  
                
                    Text("OR")
                        .foregroundColor(.orange)
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .center)
                    
                    
                    CustomButton(
                        btnTxt: "Explore LTS",
                        OnTap: {
                            route.navigateToRoot()
                            model.isLogin = true
                            model.isGuest = true
                        },
                        isLoding: .constant(false)
                    )
                    .padding(.horizontal)
                    
                    
                    HStack {
                        Text("Don’t have an account?")
                            .foregroundColor(.white)
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                        
                        Button(action: {
                            route.navigate(to: .signUpPage)
                        }, label: {
                            Text("Sign Up")
                                .foregroundColor(.orange)
                                .font(.system(size: 18))
                                .fontWeight(.bold)
                        })
                        
                    }
                    .padding(.vertical,12)
                }
            }
            
        }
        .alert(isPresented: $loginViewModel.shouldShowAlert){
            return Alert(
                title: Text("Error"),
                message: Text(loginViewModel.loginError?.localizedDescription ?? "An unknown error occurred.")
            )
        }
        
    }
}

#Preview {
    LoginView()
        .environmentObject(Route())
        .environmentObject(LeandingModel())
        
}
