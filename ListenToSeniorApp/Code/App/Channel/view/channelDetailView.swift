//
//  channelDetailView.swift
//  ListenToSeniorApp
//
//  Created by MAC0013 on 29/10/24.
//

import SwiftUI

struct channelDetailView: View {
    var body: some View {
        ScrollView{
            VStack{
                Image("img1")
                    .resizable()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .frame(height: 140)
                
                Image("img3")
                    .resizable()
                    .scaledToFill()
                    .frame(width:60,height: 60)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                
                HStack {
                    Text("Purav Jha")
                        .font(.system(size: 24)).bold()
                    
                    Image(systemName: "checkmark.circle.fill")
                }
                .padding(.bottom,2)
                
                HStack {
                    Text("@PuravJha")
                        .font(.footnote).bold()
                    
                    Text("98.5 lakh subscribers 652 videos")
                        .font(.footnote)
                        .foregroundColor(.black.opacity(0.6))
                }
                .padding(.bottom,2)
                
                Text("Hello people !! I am Purav jha.I create some fun and   relatable video. Do Subscribe :)")
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black.opacity(0.6))
                    .padding(.horizontal,10)
                    .padding(.bottom, 8)
                
                Text("Subscribe")
                    .bold()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.white)
                    .padding(.vertical,7)
                    .background(.black)
                    .cornerRadius(18)
                    .padding(.horizontal)
                
                
                VStack(alignment: .leading) {
                    Text("Videos :")
                        .font(.headline)
                        .foregroundColor(.black.opacity(0.6))
                        .padding(.all,10)
                    
                    ScrollView{
                        ForEach(1...5, id: \.self){index in
                            customVideoCardView()
                        }
                    }
                    
                    
                }
                .padding(.horizontal,10)
                
                
                
            }
        }
    }
    
}

#Preview {
    channelDetailView()
}
