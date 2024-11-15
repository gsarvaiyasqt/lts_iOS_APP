//
//  ProfilePage.swift
//  ListenToSeniorApp
//
//  Created by MAC0013 on 22/10/24.
//

import SwiftUI

struct ProfilePage: View {
    @EnvironmentObject var route : Route
    @EnvironmentObject var model : LeandingModel
    @State private var isLogoutAlert : Bool = false
    
    var body: some View {
        
        ZStack {
            Color.black.ignoresSafeArea()
            ScrollView{
                VStack(alignment:.leading) {
                    
                    HStack {
                        
                        ZStack {
                            
                            Circle()
                                .foregroundColor(.white)
                                .frame(width: 70,height: 70)
                            
                            Text("U")
                                .font(.system(size: 40))
                                .font(.title).bold()
                                .foregroundStyle(.black)
                            
                        }
                        .padding(.trailing,5)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("DeveloperS")
                                .font(.system(size: 24))
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
                                .foregroundStyle(.white)
                            
                            Button(action: {
                                route.navigate(to: .profileDetailPage)
                            }, label: {
                                HStack {
                                    Text("@DeveloperS - yd4mw")
                                        .font(.system(size: 14))
                                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
                                        .foregroundStyle(.gray)
                                    
                                    Color.gray.frame(width: 1,height: 18)
                                    
                                    HStack {
                                        Text("View Channel")
                                            .font(.system(size: 14))
                                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
                                            .foregroundStyle(.gray)
                                        
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.gray)
                                    }
                                }
                            })
                            
                        }
                        
                    }
                    
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack {
                            ForEach(someDataList.indices, id: \.self) { index in
                                HStack {
                                    
                                    Image(systemName: "person.circle")
                                    
                                    Text(someDataList[index])
                                        .foregroundStyle(.white)
                                    
                                }
                                .padding(.all,8)
                                .background(.gray.opacity(0.7))
                                .clipShape(.rect(cornerRadius: 18))
                            }
                        }
                    }
                    
                    HStack{
                        Text("History")
                            .font(.system(size: 20))
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
                            .foregroundStyle(.white)
                        
                        Spacer()
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("View all")
                                .foregroundStyle(.white)
                                .padding(.horizontal,14)
                                .padding(.vertical,10)
                        })
                        .buttonStyle(.plain)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.gray, lineWidth: 1))
                    }
                    .padding(.top, 10)
                    
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(1...5, id: \.self){ index in
                                Button(action: {
                                    route.navigate(to: .homeDetail(homeCardViewList[1]))
                                }, label: {
                                    ProfileVideoCard()
                                })
                                
                            }
                        }
                    }
                    
                    HStack{
                        Text("Playlist")
                            .font(.system(size: 20))
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
                            .foregroundStyle(.white)
                        
                        Spacer()
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("View all")
                                .foregroundStyle(.white)
                                .padding(.horizontal,10)
                                .padding(.vertical,8)
                        })
                        .buttonStyle(.plain)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.gray, lineWidth: 1))
                    }
                    .padding(.top, 4)
                    
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(1...5, id: \.self){ index in
                                Button(action: {
                                    route.navigate(to: .homeDetail(homeCardViewList[1]))
                                }, label: {
                                    ProfileVideoCard()
                                })
                            }
                        }
                    }
                    
                    makeButtonLabel(
                        imageStr: "play.square",
                        btnText: "Your Videos") {
                            
                        }
                    
                    makeButtonLabel(
                        imageStr: "arrow.down.square",
                        btnText: "Downloads") {
                            
                        }
                    
                    Divider()
                        .background(.white)
                
                    
                    makeButtonLabel(
                        imageStr: "play.square",
                        btnText: "Get LTS Permium") {
                            
                        }
                
                    
                    makeButtonLabel(
                        imageStr: "arrow.down.square",
                        btnText: "Privacy Policy") {
                            
                        }
                    
                    Divider()
                        .background(.white)
                    
                    makeButtonLabel(
                        imageStr: "arrow.down.square",
                        btnText: "Terms & Condition") {
                            
                        }
                    
                    makeButtonLabel(
                        imageStr: "xmark.circle",
                        btnText: "LogOut") {
                            
                            isLogoutAlert = true
                            
                        }
                        .alert("Logout", isPresented: $isLogoutAlert) {
                                                                
                            Button("Logout", role: .destructive){
                                route.navigateToRoot()
                                model.isLogin = false
                                TokenManager.shared.clearToken()
                            }
                            
                            Button("Cancel",role: .cancel){}
                            
                        }message: {
                            Text("Are You Sure ?")
                        }
            
                }
                .padding(.horizontal, 8)}
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 20) // Adds inset for the top safe area
            }
        }
        
        
    }
    
    
    @ViewBuilder
    func makeButtonLabel(
        imageStr : String ,
        btnText : String ,
        onTap : @escaping () -> Void
    ) -> some View{
        
        Button(action: onTap, label: {
            HStack{
                Image(systemName: imageStr)
                    .foregroundColor(.white)
                
                Text(btnText)
                    .foregroundStyle(.white)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            
        })
        .padding(.vertical, 10)
    }
    
}

var someDataList = ["Switch Account", "Share Channel" , "More Info"]

#Preview {
    ProfilePage()
        .environmentObject(Route())
        .environmentObject(LeandingModel())
}
