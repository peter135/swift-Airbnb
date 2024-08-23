//
//  MainTabView.swift
//  airbnb
//
//  Created by 炜季 on 2024/8/12.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView{
            ExploreView()
                .tabItem { Label("Explore",systemImage: "magnifyingglass") }
            
            WishListView()
                .tabItem { Label("WishList",systemImage: "heart") }
            
            ProfileView()
                .tabItem { Label("Profile",systemImage: "person") }
        }
    }
}

#Preview {
    MainTabView()
}
