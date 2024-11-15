//
//  customTabView.swift
//  ListenToSeniorApp
//
//  Created by MAC0013 on 22/10/24.
//

import SwiftUI

struct customTabView: View {
    
    @Binding var selectTab : Int
    @Namespace private var animation
    @EnvironmentObject var route: Route
    
    var body: some View {
        
        VStack(alignment:.trailing){
            HStack{
                ForEach(tabItems, id :\.id, content: {ele in
                    Spacer()
                    
                    Button(action: {
                        selectTab = ele.index
                        
                    },label: {
                        VStack {
                        
                            Image(systemName: selectTab == ele.index ? ele.selectedIconName : ele.iconName)
                                .resizable()
                                .foregroundColor(
                                    selectTab == ele.index ? .white :  .gray
                                )
                                .frame(width: 24,height: 24)
                            
                            
                            if(selectTab == ele.index){
                                Circle()
                                     .frame(width:8, height: 8)
                                     .foregroundColor(.orange)
                                     .matchedGeometryEffect(id: "select", in: animation)
                                     .offset(y:3)
                                     
                            }else{
                                Circle()
                                    .foregroundColor(.clear)
                                     .frame(width:8, height: 8)
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
    var selectedIconName: String
}

let tabItems = [
    TabBar(index: 1, iconName: "house", selectedIconName: "house.fill"),

    TabBar(index: 2, iconName: "plus.app", selectedIconName: "plus.app.fill"),
    
    TabBar(index: 3, iconName: "play.square.stack", selectedIconName: "play.square.stack.fill"),

    TabBar(index: 4, iconName: "person",selectedIconName: "person.fill"),
]

