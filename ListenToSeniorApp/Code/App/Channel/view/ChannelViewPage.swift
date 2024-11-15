//
//  ChannelViewPage.swift
//  ListenToSeniorApp
//
//  Created by MAC0013 on 29/10/24.
//

import SwiftUI

struct ChannelViewPage: View {
    
    @StateObject private var viewModel = ChannelModel()
    @State var selectTab : Int = 0
    @Namespace private var animation
    
    var body: some View {
        ZStack{
//            Color.black.ignoresSafeArea()
            
            VStack{
                channelToolbar()
                
                ScrollView(.horizontal) {
                    HStack{
                        ForEach(channelTabList.indices, id: \.self){ele in
                            
                            Button(action: {
                                viewModel.selectTab = ele
                            }, label: {
                                VStack{
                                    Text(channelTabList[ele])
                                        .font(.system(size: 18))
                                        .bold()
                                        .foregroundStyle(.black)
                                    
                                    if(viewModel.selectTab == ele){
                                        Color.black
                                            .frame(maxWidth:/*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                                            .frame(height: 1)
                                            .matchedGeometryEffect(id: "select", in:animation)
                                        
                                            
                                    }else{
                                        Color.clear
                                            .frame(maxWidth:/*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                                            .frame(height: 2)
                                    }
                                    
                                }
                                .padding(.horizontal,5)
                                .animation(.spring(),value: viewModel.selectTab)
                            })
                        }
                    }
                    .padding(.leading, 20)
                }
                .padding(.vertical,10)
                
                
                TabView(selection: $viewModel.selectTab){
                    channelDetailView()
                        .tag(0)
                    
                    channelVideos()
                        .tag(1)
                    
                    channelPaylist()
                        .tag(2)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                
            }
        }
    }
}


struct channelToolbar:  View {
    
    @EnvironmentObject var route : Route
    
    var body: some View {
        HStack{
            Button(action: {
                route.navigateBack()
            }) {
                Image(systemName: "chevron.left")
                    .resizable()
                    .frame(width: 12,height: 18)
                    .foregroundColor(.black)
            }
            
            Text("User")
                .font(.title2).bold()
                .foregroundStyle(.black)
                .padding(.horizontal,10)
            
            Spacer()
            
            HStack(spacing:20){
                Button(action: { print("Bell button pressed") }) {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 22,height: 22)
                        .foregroundColor(.black)
                }
                Button(action: { print("Search button pressed") }) {
                    Image(systemName: "ellipsis")
                        .rotationEffect(.degrees(90))
                        .foregroundColor(.black)
                        
                }
            }
        }
        .padding(.horizontal,20)
    }
}

var  channelTabList = [
    "HOME",
    "VIDEOS",
    "PLAYLISTS"
]


#Preview {
    ChannelViewPage()
}
