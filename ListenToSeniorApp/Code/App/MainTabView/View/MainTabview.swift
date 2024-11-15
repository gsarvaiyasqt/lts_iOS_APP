//
//  MainTabview.swift
//  ListenToSeniorApp
//
//  Created by MAC0013 on 18/10/24.
//

import SwiftUI

struct MainTabview: View {
    @State var selectTab : Int = 1
    var body: some View {
        TabView(selection: $selectTab) {
            HomeScreen()
                .tag(1)
            
            
                .tag(2)
            
            ProfilePage()
                .tag(3)
        }
        .overlay(alignment: .bottom, content: {
            customTabView(selectTab: $selectTab)
        })
      
    }
}

#Preview {
    MainTabview(selectTab: 1)
}

