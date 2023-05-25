//
//  GradientBackground.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 25/05/2023.
//

import SwiftUI

struct GradientBackground<Content:View>: View {
    
    @ViewBuilder var content: Content
    let colors: [Color]
    let opacity: Double
    
    var body: some View {
        
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: colors),
                startPoint: .leading,
                endPoint: .trailing
            )
            .opacity(opacity)
            content
                .padding(4)
        }
        .cornerRadius(15)
    }
}

struct GradientBackground_Previews: PreviewProvider {
    static var previews: some View {
        GradientBackground(content: {
            Text("Hello World")
        }, colors: [.red, .gray, .blue], opacity: 0.8)
    }
}
