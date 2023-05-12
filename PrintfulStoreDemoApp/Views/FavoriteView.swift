//
//  FavoriteItemsView.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 09/05/2023.
//

import SwiftUI

struct FavoriteView: View {
    var body: some View {
        NavigationStack {
            Text("Favorite Items View")
                .navigationTitle("Favorite")
        }
    }
}

struct FavoriteItemsView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
