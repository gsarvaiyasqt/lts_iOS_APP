//
//  HomeDetailView.swift
//  ListenToSeniorApp
//
//  Created by MAC0013 on 21/10/24.
//

import SwiftUI

struct HomeDetailView: View {
    var viewModel: HomeCardViewModel
    @State private var addComment : String = ""
    
    var body: some View {
        ZStack(alignment: .leading){
            Color.black.ignoresSafeArea()
            
            VStack(alignment:.leading){
                
                if let url = URL(string: "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4") {
                          VideoPlayerView(videoURL: url)
                      } else {
                          Text("Invalid video URL")
                      }
    
                
                ScrollView {
                    VStack(alignment:.leading){
                        Text(viewModel.headline)
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding(.bottom,3)
                        
                        HStack{
                            Text(viewModel.videoViews)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            Text(viewModel.uploadTime)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            Text(".... More")
                                .font(.subheadline)
                                .foregroundColor(.white)
                            
                        }
                        .padding(.bottom,3)
                        
                        channelInfo
                        
                        viewsInfoButtons
                        
                        Text("77 Comments")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .padding(.top, 10)
                        
                        
                        HStack {
                            Image("img2")
                                .resizable()
                                .frame(width: 30,height: 30)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            
                            TextField("Add Your Comment", text: $addComment)
                                .textFieldStyle(.automatic)
                                .padding(.horizontal,8)
                                .padding(.vertical,8)
                                .background(.white.opacity(0.8))
                                .clipShape(.rect(cornerRadius: 8))
                                .foregroundColor(.white)

                        }
                        
                        LazyVStack(alignment:.leading){
                            ForEach(1...12, id: \.self, content: {ele in
                                HStack{
                                    Image("img3")
                                        .resizable()
                                        .frame(width: 30,height: 30)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                
                                    
                                    VStack(alignment:.leading) {
                                        Text("User \(ele)")
                                            .font(.title3)
                                            .foregroundStyle(.white)
                                        
                                        Text("Comments \(ele)")
                                            .font(.title3)
                                            .foregroundStyle(.gray)
                                    }
                                    .padding(.horizontal,10)

                                }
                            })
                        }
                    }
                }
        
            }
            .padding(.horizontal,10)
        }
    }
    
}

private extension HomeDetailView{
    
    
    
//    ================================== ViewINfoButton
    
    var channelInfo: some View {
           HStack(spacing: 12) {
               HStack {
                   Image(viewModel.channelLogoImg)
                       .resizable()
                       .frame(width: 32, height: 32)
                       .clipShape(Circle())
                   
                   Text(viewModel.channelName)
                       .font(.title3)
                       .foregroundColor(.white)
               }
        
               HStack {
                   Text(viewModel.totalSubscriber)
                       .font(.system(size: 18)).bold()
                       .foregroundColor(.gray)
                   
                   Spacer()
                   
                   
                   Button(action: {}) {
                       Text("Subscribe")
                           .font(.system(size: 14))
                           .foregroundColor(.black)
                           .padding(.horizontal, 12)
                           .padding(.vertical, 6)
                           .background(Color.white)
                           .clipShape(Capsule())
                   }
               }
           }
       }
       
//    ================================== ViewINfoButton
    
    var viewsInfoButtons: some View{
        ScrollView(.horizontal){
            
            HStack{
                HStack{
                    HStack{
                        Image(systemName: "hand.thumbsup")
                            .resizable()
                            .frame(width: 16,height: 16)
                            .foregroundColor(.white)
                        
                        Text("6.3 lakh")
                            .foregroundStyle(.white)
                            .font(.callout)
                    }
                    
                    Divider()
                        .frame(width: 1,height: 18)
                        .background(.white)
                        .padding(.horizontal,8)
                    
                    Image(systemName: "hand.thumbsdown")
                        .resizable()
                        .frame(width: 16,height: 16)
                        .foregroundColor(.white)
                    
                        
                }
                .padding(.all,10)
                .background(.gray.opacity(0.2))
                .clipShape(.capsule)
                
                
                ActionButton(icon: "share", label: "Share")
                
                ActionButton(icon: "copy", label: "copy")
                
            }
        }
    }
    
    
//    ================================== Commnet Selection
    
      
}


private struct ActionButton: View {
    var icon: String
    var label: String
    
    var body: some View {
        HStack(spacing: 6) {
            Image(icon)
                .resizable()
                .frame(width: 18, height: 18)
                .foregroundColor(.white)
            
            if !label.isEmpty {
                Text(label)
                    .foregroundColor(.white)
                    .font(.callout)
            }
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 10)
        .background(Color.gray.opacity(0.2))
        .clipShape(Capsule())
    }
}


#Preview {
    HomeDetailView(viewModel: homeCardViewList[1])
}
