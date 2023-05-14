//
//  EmptyInfoScreen.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 14/05/2023.
//

import SwiftUI

struct EmptyInfoScreen: View {
    
    let message: String
    let image: Images
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text(message.capitalized)
                .font(.title2)
            image
        }
    }
}

struct EmptyInfoScreen_Previews: PreviewProvider {
    static var previews: some View {
        EmptyInfoScreen(message: "Info text here", image: .xmark)
    }
}
