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
    case share = "square.and.arrow.up"
    
    var body: some View {
        Image(systemName: rawValue)
    }
}

enum Images: String, View {
    case xmark = "xmark"
    case heartCircle = "heart.circle"
    case photo = "photo"
    
    var body: some View {
        Image(systemName: rawValue)
            .resizable()
            .frame(width: 40, height: 40)
    }
}

enum AssetImage: String, View {
    case launchScreenLogo = "LaunchScreenLogo"
    
    var body: some View {
        Image("\(self.rawValue)")
            .resizable()
            .scaledToFit()
    }
}

enum TabBarTitles: String, View {
    case home = "categories"
    case favorite = "favorite"
    
    var body: some View {
        Text(rawValue.capitalized)
    }
}


enum SizeOfCategoryImage: String, Codable {
    case small
    case medium
    case large
}
