//
//  EmptyInfoScreen.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 14/05/2023.
//

import SwiftUI

struct EmptyInfoScreen: View {
    
    @State var shouldShake: Bool = false
    
    let message: String
    let image: Images
    
    var body: some View {
        VStack(
            alignment: .center,
            spacing: Constants.shared.spacing
        ) {
            Spacer()
            Spacer()
            Text(message.capitalized)
                .font(.title)
                .modifier(ShakeEffect(shouldShake: shouldShake))
                
            Spacer()
            image
                .foregroundColor(shouldShake ? .red : .accentColor)
                .modifier(ShakeEffect(shouldShake: shouldShake))
            Spacer()
            Spacer()
        }
        .onAppear{
            withAnimation(.default) {
                shouldShake.toggle()
            }
        }
    }
}

struct EmptyInfoScreen_Previews: PreviewProvider {
    static var previews: some View {
        EmptyInfoScreen(message: "Info text here", image: .xmark)
    }
}


