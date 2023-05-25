//
//  TextCapsuleView.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 24/05/2023.
//

import SwiftUI

struct TextBackgroundView<Content:View>: View {
    
    @ViewBuilder var content: Content
    @State private var scale: CGFloat = 0.5
    let color: Color
    let opacity: Double
    
    var body: some View {
        ZStack{
            color
                .opacity(opacity)
            content
                .padding(6)
        }
        .cornerRadius(15)
        .scaleEffect(scale)
        .onAppear{
            withAnimation(.spring().delay(0.2)) {
                scale = 1.0
            }
        }
    }
}

struct TextCapsuleView_Previews: PreviewProvider {
    static var previews: some View {
        TextBackgroundView(content: {
            Text("Hello")
        }, color: .red, opacity: 0.8)
    }
}
