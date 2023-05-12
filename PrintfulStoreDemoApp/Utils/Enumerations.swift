//
//  Enumerations.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 09/05/2023.
//

import SwiftUI

enum TabBarIcons: String, View {
    
    case home = "house"
    case heart = "heart"
    case hearFill = "heart.fill"

    var body: some View {
        Image(systemName: rawValue)
    }
}


enum TabBarTitles: String, View {
    case home = "categories"
    case favorite = "favorite"
    
    var body: some View {
        Text(rawValue.capitalized)
    }
}


enum SizeOfCategoryImage: String, Decodable {
    case small
    case medium
    case large
}
