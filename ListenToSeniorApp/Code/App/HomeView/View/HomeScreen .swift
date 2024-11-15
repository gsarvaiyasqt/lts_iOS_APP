//
//  HomeScreen.swift
//  ListenToSeniorApp
//
//  Created by MAC0013 on 21/10/24.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject private var viewModel = HomeScreenModel()
    
    var body: some View {
        
        ZStack(alignment: .topLeading){
            Color.black.ignoresSafeArea()
            
            VStack(alignment: .leading){
                
                HomeToolbar()
                
                FilterScrollView(selectedTab: $viewModel.selectTab)
                
                HomeCardList()
            }
        }

    }
    
}


struct HomeToolbar:  View {
    var body: some View {
        HStack{
            Image("ltslogo")
                .resizable()
                .frame(width: 115, height: 40)
                .aspectRatio(contentMode: .fill)
            Spacer()
            
            HStack(spacing:20){
                Button(action: { print("Bell button pressed") }) {
                    Image(systemName: "bell")
                        .resizable()
                        .frame(width: 18,height: 18)
                        .foregroundColor(.white)
                }
                Button(action: { print("Search button pressed") }) {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 18,height: 18)
                        .foregroundColor(.white)
                }
            }
        }
        .padding(.horizontal,20)
    }
}

struct FilterScrollView: View {
    
    @EnvironmentObject var router: Route
    @StateObject private var viewModel = HomeScreenModel()
    
    var fList : [FilterData] = filterList
    @Binding var selectedTab: Int
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(fList.indices, id: \.self) { index in
                    
                    let filter = fList[index]
                    let isSelected = selectedTab == index
                                       
                    FilterButton(filter: filter, isSelected: isSelected) {
                        selectedTab = index
                        
                    }
                }
            }
            .padding(.leading, 15)
        }
        .padding(.vertical, 18)
    }
}


struct FilterButton: View {
    let filter: FilterData
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack {
                Text(filter.FString)
                    .font(.system(size: 18))
                    .foregroundColor(isSelected ? .black : .white)
                    .fontWeight(.medium)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 8)
            .background(isSelected ? Color.white: Color.white.opacity(0.5), in: RoundedRectangle(cornerRadius: 6))
        }
    }
}



#Preview {
    HomeScreen()
        .environmentObject(Route())
}


struct FilterData: Identifiable {
    var id = UUID()
    var FString: String
}


let filterList : [FilterData] =  [
    FilterData(FString: "All"),
    FilterData(FString: "Music"),
    FilterData(FString: "Masala"),
    FilterData(FString: "films"),
    FilterData(FString: "Live"),
    FilterData(FString: "Dramedy"),
    FilterData(FString: "Gaming"),

]
