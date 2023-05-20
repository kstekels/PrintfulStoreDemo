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
    
    init(subdetails: String, text: String) {
        self.subdetails = subdetails.capitalized
        self.text = text.capitalized
    }
    
    var body: some View {
        Text("\(subdetails): \(text)")
            .detailsTextViewStyle()
    }
}

struct SubdetailsTextView_Previews: PreviewProvider {
    static var previews: some View {
        SubdetailsTextView(subdetails: "Brand", text: "Adidas")
    }
}
