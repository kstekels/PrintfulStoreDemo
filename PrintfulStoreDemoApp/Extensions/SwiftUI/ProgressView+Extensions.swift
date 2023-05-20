//
//  ProgressView+Extensions.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 20/05/2023.
//

import SwiftUI

extension ProgressView {
    
    func defaultStyle() -> some View {
        self
            .scaleEffect(Constants.shared.progresViewScale)
    }
    
    func defaultStyleWithFrame(frameWidth: CGFloat, frameHeight: CGFloat) -> some View {
        self
            .defaultStyle()
            .frame(width: frameWidth, height: frameHeight)
    }
}
