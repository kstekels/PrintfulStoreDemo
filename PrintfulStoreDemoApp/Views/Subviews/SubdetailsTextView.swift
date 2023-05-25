//
//  SubdetailsTextView.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 15/05/2023.
//

import SwiftUI

struct SubdetailsTextView: View {
    
    let subdetails: String
    let text: String
    var opacity: Double
    var color: Color
    
    init(subdetails: String, text: String, opacity: Double = 1, color: Color = .red) {
        self.subdetails = subdetails.capitalized
        self.text = text.capitalized
        self.opacity = opacity
        self.color = color
    }
    
    var body: some View {
        HStack {
            Text("\(subdetails):")
            TextBackgroundView(content: {
                Text("\(text)")
            }, color: color, opacity: opacity)
        }
        .padding(.horizontal, 6)
    }
}

struct SubdetailsTextView_Previews: PreviewProvider {
    static var previews: some View {
        SubdetailsTextView(subdetails: "Brand", text: "Adidas")
    }
}
