//
//  MainTabview.swift
//  ListenToSeniorApp
//
//  Created by MAC0013 on 18/10/24.
//

import SwiftUI
struct MainTabview: View {
    @EnvironmentObject var router: Route
    @State var selectTab : Int = 1
    
    var selected : Bool = false
    var body: some View {
        ZStack() {
            Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all)
            
            TabView(selection: $selectTab) {
                HomeScreen()
                    .tag(1)
                    .background(Color.black.ignoresSafeArea())
                
                CreatePostPage()
                    .tag(2)
                    .background(Color.black.ignoresSafeArea())
                
                SubscriptionsPage()
                    .tag(3)
                    .background(Color.black.ignoresSafeArea())
                
                ProfilePage()
                    .tag(4)
                    .background(Color.black.ignoresSafeArea())
            }
        
            

            
            VStack {
                Spacer()
                customTabView(selectTab: $selectTab)
                    .background(Color.black)
                    .safeAreaInset(edge: .bottom) {
                        Color.clear.frame(height: 20) // Adds inset for the top safe area
                    }
                
            }
            .ignoresSafeArea(edges: .bottom)
            
            
        }
        
    }

}

#Preview {
    MainTabview(selectTab: 1)
        .environmentObject(Route())
}

