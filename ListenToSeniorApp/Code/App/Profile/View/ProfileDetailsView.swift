//
//  ProfileDetailsView.swift
//  ListenToSeniorApp
//
//  Created by MAC0013 on 05/11/24.
//

import SwiftUI

struct ProfileDetailsView: View {
    @State var selectTab : Int = 1
    
    @EnvironmentObject var route : Route
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            
            VStack{
                ProfileDetailsToolbar()
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading){
                        HStack {
                            
                            ZStack {
                                
                                Circle()
                                    .foregroundColor(.white)
                                    .frame(width: 70,height: 70)
                                
                                Text("U")
                                    .font(.system(size: 40))
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
                                    .foregroundStyle(.black)
                                
                            }
                            .padding(.trailing,5)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("DeveloperS")
                                    .font(.system(size: 24))
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
                                    .foregroundStyle(.white)
                                
                                Text("@DeveloperS - yd4mw")
                                    .font(.system(size: 14))
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
                                    .foregroundStyle(.gray)
                                
                              
                            }
                            
                        }
                        .padding(.horizontal,15)
                        .padding(.vertical,15)
                        
                        HStack {
                            Text("Manage Videos")
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                                .foregroundStyle(.white)
                                .padding(.vertical,10)
                                .background(.gray.opacity(0.4))
                            .clipShape(.rect(cornerRadius: 18))
                            
                        
                            Button(action: {
                                route.navigate(to: .profileEditPage)
                            }, label: {
                                Image(systemName: "pencil")
                                    .resizable()
                                    .frame(width: 24,height: 24)
                                    .foregroundColor(.white)
                                    .padding(.all,10)
                                    .background(.gray.opacity(0.4))
                                    .clipShape(.rect(cornerRadius: 18))
                            })
                       
                                
                        }
                        
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(1...7, id: \.self){ index in
                                    Button(action: {
                                        selectTab = index
                                    }, label: {
                                        Text("Videos\(index)")
                                            .foregroundStyle(selectTab == index ? .black : .white)
                                            .padding(.horizontal,14)
                                            .padding(.vertical,10)
                                            .background(selectTab == index ? .white : .gray.opacity(0.4))
                                            .clipShape(.rect(cornerRadius: 10))
                                    })
                                    
                                }
                            }
                            .padding(.vertical,10)
                            .padding(.leading,10)
                        }
                        
                        VStack{
                            ForEach(1...10,id: \.self){ index in
                                ProfileCustomCard()
                            }
                        }
                    }
                }
                
            }
            
        }
    }
}


struct ProfileDetailsToolbar:  View {
    
    @EnvironmentObject var route : Route
    
    var body: some View {
        HStack{
            Button(action: {
                route.navigateBack()
            }) {
                Image(systemName: "chevron.left")
                    .resizable()
                    .frame(width: 12,height: 18)
                    .foregroundColor(.white)
            }
            
            Text("DeveloperS")
                .font(.title2).bold()
                .foregroundStyle(.white)
                .padding(.horizontal,10)
            
            Spacer()
            
            HStack(spacing:20){
                Button(action: { print("Bell button pressed") }) {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 22,height: 22)
                        .foregroundColor(.white)
                }
                Button(action: { print("Search button pressed") }) {
                    Image(systemName: "ellipsis")
                        .rotationEffect(.degrees(90))
                        .foregroundColor(.white)
                        
                }
            }
        }
        .padding(.horizontal,20)
    }
}

#Preview {
    ProfileDetailsView()
}
