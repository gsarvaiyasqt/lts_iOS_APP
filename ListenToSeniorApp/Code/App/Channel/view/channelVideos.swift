//
//  channelVideos.swift
//  ListenToSeniorApp
//
//  Created by MAC0013 on 29/10/24.
//

import SwiftUI

struct channelVideos: View {
    
    @State var select: Int = 0
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                ScrollView{
                    HStack {
                        ForEach(listName.indices, id: \.self, content: { index in
                            
                            Button(action: {
                                select = index
                            }, label: {
                                Text(listName[index])
                                    .foregroundStyle(select == index ?.white : .black)
                                    .padding(.horizontal,12)
                                    .padding(.vertical,8)
                                    .background(select == index ? .black : .gray.opacity(0.4))
                                    .clipShape(.rect(cornerRadius: 8))
                            })
                            
                            
                        })
                    }
                    
                    .padding(.vertical,10)
                    
                }
                
                ForEach(1...15, id: \.self){ index in
                    customVideoCardView()
                }
                
            }
            .padding(.horizontal,15)
        }
    }
}

var listName = ["Latest" , "Popular" , "Oldest"]

#Preview {
    channelVideos(select: 0)
}

