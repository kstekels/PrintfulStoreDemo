//
//  HomeView.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 09/05/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            CategoriesView()
                .tabItem {
                    TabBarIcons.home
                    TabBarTitles.home
                }
            FavoriteItemsView()
                .tabItem {
                    TabBarIcons.heart
                    TabBarTitles.favorite
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
