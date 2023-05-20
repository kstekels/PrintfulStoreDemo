//
//  RowItemTextTitleView.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 14/05/2023.
//

import SwiftUI

struct RowItemTitleView: View {
    
    let title: String
    var fontSize: Double?
    
    var body: some View {
        Text(title)
            .rowItemTextView(fontSize: fontSize)
    }
}
