//
//  customVideoCardView.swift
//  ListenToSeniorApp
//
//  Created by MAC0013 on 29/10/24.
//

import SwiftUI

struct customVideoCardView: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack(alignment: .top){
                ZStack(alignment:.bottomTrailing) {
                    Image("img2")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width: 150,height: 90)
                        .cornerRadius(8)
                    
                    Text("11:80")
                        .font(.footnote).bold()
                        .foregroundStyle(.white)
                        .padding(.all,5)
                        .background(.black.opacity(0.7))
                        .cornerRadius(4)
                        .padding(.all,10)
                        
                }
                
                VStack(alignment: .leading) {
                    Text("Swift UI full Course and Learnig about  Swift")
                        .lineLimit(2)
                        .font(.headline)
                        
                    
                    Text("98.5 lakh subscribers 652 videos")
                        .font(.footnote)
                        .foregroundColor(.black.opacity(0.6))
                        .lineLimit(1)
                    
                }
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName:"ellipsis")
                        .foregroundColor(.black)
                        .imageScale(.large)
                        .rotationEffect(.degrees(90))
                        .padding(.vertical)
                })
            }
            
        }
    }
}

#Preview {
    customVideoCardView()
}
