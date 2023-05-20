//
//  Image+Extensions.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 20/05/2023.
//

import SwiftUI

extension Image {
    func rowItemImageStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .cornerRadius(Constants.shared.cornerRadius)
    }
}
