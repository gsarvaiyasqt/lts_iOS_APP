//
//  HomeCardView.swift
//  ListenToSeniorApp
//
//  Created by MAC0013 on 25/10/24.
//

import SwiftUI

struct HomeCardList: View {
    @EnvironmentObject var router: Route
    @StateObject private var viewModel = HomeScreenModel()
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(){
                ForEach(homeCardViewList.indices,id: \.self){ index  in
                    Button(action: {
                        router.navigate(to: .homeDetail(homeCardViewList[index]))
                    }, label: {
                        HomeCardView(homeCardData: homeCardViewList[index])
                    })
                }
            }
        }
        .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 10) // Adds inset for the top safe area
         }
        
    }
}

struct HomeCardView: View {
    let homeCardData : HomeCardViewModel
    @EnvironmentObject var route : Route
    
    var body: some View {
    
        VStack{
                ZStack(alignment:.bottomTrailing){
                    Image(homeCardData.thumbnillImg)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: UIScreen.main.bounds.height / 4.5)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        
                        
                    
                    Text(homeCardData.videoLength)
                        .font(.subheadline)
                        .padding(.horizontal)
                        .padding(.vertical,8)
                        .background(.black.opacity(0.7), in: RoundedRectangle(cornerRadius: 8))
                        .foregroundStyle(.white)
                        .padding(.horizontal,12)
                        .padding(.vertical,12)
                    
                }

                
                HStack(alignment: .top){
                    
                    Button(action: {
                        route.navigate(to: .ChannelViewPage)
                    }, label: {
                        Image(homeCardData.channelLogoImg)
                              .resizable()
                              .scaledToFill()
                              .frame(width: 35, height: 35)
                              .clipShape(Circle())
                              .padding(.horizontal,8)
                              .padding(.vertical,4)
                    })
                 
                    
                    VStack(alignment:.leading, spacing: 3){
                        Text(homeCardData.headline)
                            .font(.headline)
                            .fontWeight(.regular)
                            .lineLimit(4)
                            .foregroundColor(.white)
                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment:.leading)
                        
                        Text("\(homeCardData.channelName) | \(homeCardData.videoViews) | \(homeCardData.uploadTime)")
                            .font(.subheadline)
                            .fontWeight(.regular)
                            .lineLimit(2)
                            .foregroundColor(.white.opacity(0.7))
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment:.leading)
                    }
//                    .padding(.vertical,10)
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image("three_dot")
                            .resizable()
                            .frame(width: 16,height: 20)
                    })
//                    .padding(.vertical,5)
//                    .padding(.horizontal,5)
            

                }
                .padding(.vertical,15)
                .background(.black)
                
                
            }
        

    }
}

#Preview {
    HomeCardList()
//    HomeCardView(homeCardData: homeCardViewList[4])
}


struct HomeCardViewModel: Codable, Hashable{
    var thumbnillImg : String
    var headline: String
    var videoLength: String
    var channelLogoImg: String
    var channelName: String
    var videoViews: String
    var uploadTime: String
    var totalSubscriber : String
}


let homeCardViewList : [HomeCardViewModel] = [
    HomeCardViewModel(
        thumbnillImg: "img1",
        headline: "Super Power Scroll Views - SwiftUI - iOS 17", 
        videoLength: "2:20",
        channelLogoImg: "img6",
        channelName: "Sean Allen",
        videoViews: "28K views",
        uploadTime: "1 year ago ",
        totalSubscriber: "100k"
    ),
    
    HomeCardViewModel(
        thumbnillImg: "img2",
        headline: "Super Power Scroll Views - SwiftUI - iOS 17",
        videoLength: "57:20", 
        channelLogoImg: "img1",
        channelName: "Sean Allen",
        videoViews: "28K views",
        uploadTime: "1 year ago ",
        totalSubscriber: "100lakh"
    ),
    
    HomeCardViewModel(
        thumbnillImg: "img3",
        headline: "Super Power Scroll Views - SwiftUI - iOS 17",
        videoLength: "40:20",
        channelLogoImg: "img2",
        channelName: "Sean Ruby",
        videoViews: "214k views",
        uploadTime: "6 month ago",
        totalSubscriber: "10k"
        
    ),
    
    HomeCardViewModel(
        thumbnillImg: "img4",
        headline: "Super Power Scroll Views - SwiftUI - iOS 17", 
        videoLength: "4:40",
        channelLogoImg: "img3",
        channelName: "Sean Ruby",
        videoViews: "214k views",
        uploadTime: "6 month ago",
        totalSubscriber: "10 lakh"
    ),
    
    HomeCardViewModel(
        thumbnillImg: "img5",
        headline: "Youtube Clone Swift UI",
        videoLength: "5:78",
        channelLogoImg: "img4",
        channelName: "Speed code SWIFT UI",
        videoViews: "870 views",
        uploadTime: "15 days ago ",
        totalSubscriber: "100"
        
    ),
    
    HomeCardViewModel(
        thumbnillImg: "img6",
        headline: "Loome Clone Step by Step",
        videoLength: "8:40", 
        channelLogoImg: "img5",
        channelName: "Clone To Clone",
        videoViews: "140k views",
        uploadTime: "4 year ago ",
        totalSubscriber: "100"
    ),
    
    HomeCardViewModel(
        thumbnillImg: "img1",
        headline: "Super Power Scroll Views - SwiftUI - iOS 17",
        videoLength: "8:10",
        channelLogoImg: "img6",
        channelName: "Sean Allen",
        videoViews: "28K views",
        uploadTime: "1 year ago ",
        totalSubscriber: "100"
    ),
    
]
