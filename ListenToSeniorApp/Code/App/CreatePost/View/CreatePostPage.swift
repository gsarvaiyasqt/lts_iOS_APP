//
//  CreatePostPage.swift
//  ListenToSeniorApp
//
//  Created by MAC0013 on 22/10/24.
//

import SwiftUI


enum createPostEnum {
    case addChannel
    case addPost
}

struct CreatePostPage: View {
    
    @State private var selectTab : createPostEnum = .addChannel
    @Namespace private var animation
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            
            VStack{
                HStack(spacing : 20){
                    
                    Button(action: {
                        selectTab = .addChannel
                    }, label: {
                        VStack {
                            Text("Add Channel")
                                .foregroundStyle(.white).bold()
                                .font(.title3)
                            
                            if(selectTab == .addChannel){
                                Color.orange
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                                    .frame(height: 1)
                                    .foregroundColor(.orange)
                                    .padding(.horizontal)
                                    
                            }else{
                                Color.clear
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                                    .frame(height: 1)
                                    .foregroundColor(.orange)
                            }
                            
                        }
                        .animation(.spring(), value: selectTab)
                    })
                
                    Button(action: {
                        selectTab = .addPost
                    }, label: {
                        VStack {
                            Text("Add Post")
                                .foregroundStyle(.white).bold()
                                .font(.title3)
                            
                            if(selectTab == .addPost){
                                Color.orange
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                                    .frame(height: 1)
                                    .foregroundColor(.orange)
                                    .padding(.horizontal)
                                    
                            }else{
                                Color.clear
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                                    .frame(height: 1)
                                    .foregroundColor(.orange)
                            }
                        }
                        .animation(.spring(), value: selectTab)
                        
                    })
                    
                }
                .padding(.horizontal, 10)
                .padding(.bottom, 15)
                
                TabView(selection: $selectTab, content:  {
                    AddChannel()
                        .tag(createPostEnum.addChannel)
                    
                    AddVideoPage()
                        .tag(createPostEnum.addPost)
                })
                .tabViewStyle(.page(indexDisplayMode: .never))
                
            }
        }
    }
}

#Preview {
    CreatePostPage()
}
