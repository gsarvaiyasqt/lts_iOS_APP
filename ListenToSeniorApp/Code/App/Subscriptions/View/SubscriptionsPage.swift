//
//  SubscriptionsPage.swift
//  ListenToSeniorApp
//
//  Created by MAC0013 on 28/10/24.
//

import SwiftUI

struct SubscriptionsPage: View {
    
    @StateObject private var viewModel = HomeScreenModel()
    @EnvironmentObject var route: Route
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack{
                HomeToolbar()
                
                ScrollView(.horizontal){
                    HStack{
                        ForEach(1...10, id: \.self, content: { ele in
                            Button(action: {
                                route.navigate(to: .ChannelViewPage)
                            }, label: {
                                VStack{
                                    Image("img1")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 80,height: 80)
                                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    
                                    Text("Channel \(ele)")
                                        .font(.title3)
                                        .foregroundStyle(.white)
                                    
                                }
                                .padding(.horizontal,5)
                            })
                       
                        })
                        
                    }
                    .padding(.leading, 15)
                }
                .padding(.top,10)
                
                FilterScrollView(selectedTab: $viewModel.selectTab)
                
                HomeCardList()
                
            }
        }
    }
}

#Preview {
    SubscriptionsPage()
}
