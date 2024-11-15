//
//  customTabView.swift
//  ListenToSeniorApp
//
//  Created by MAC0013 on 22/10/24.
//

import SwiftUI

struct customTabView: View {
    
    @Binding var selectTab : Int
    
    var body: some View {
        VStack(alignment:.trailing){
            HStack{
                ForEach(tabItems, id :\.id, content: {ele in
                    Spacer()
                    
                    Button(action: {
                        selectTab = ele.index
                    },label: {
                        VStack {
                        
                            Image(systemName: ele.iconName)
                                .foregroundColor(
                                    selectTab == ele.index ? .orange :  .white
                                )
                            
                            
                            if(selectTab == ele.index){
                                Rectangle()
                                    .fill(.cyan)
                                     .frame(width:15, height: 4)
                                     
                            }
                        }
                    })
                    
                    Spacer()
                    
                    
                })
            }
            .frame(height: 70)
            .background(.black,in: RoundedRectangle(cornerRadius: 15))
            
        }
        .padding(.horizontal,20)
    }
}

#Preview {
    customTabView(selectTab: .constant(1))
}

struct TabBar: Identifiable {
    var id = UUID()
    var index : Int
    var iconName: String
}

let tabItems = [
    TabBar(index: 1, iconName: "house"),
//    TabBar(iconName: "magnifyingglass"),
    TabBar(index: 2, iconName: "square.stack"),
//    TabBar(iconName: "star"),
    TabBar(index: 3, iconName: "person"),
]

