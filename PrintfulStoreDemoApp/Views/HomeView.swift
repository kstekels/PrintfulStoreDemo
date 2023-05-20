//
//  HomeView.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 09/05/2023.
//

import SwiftUI

struct HomeView: View {
    
    @State var isCategoryViewFirstTimeLoaded = true
    
    var body: some View {
        TabView {
            CategoriesView(isFirstTimeLoaded: $isCategoryViewFirstTimeLoaded)
                .tabItem {
                    TabBarIcons.home
                    TabBarTitles.home
                }
            FavoriteView()
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
