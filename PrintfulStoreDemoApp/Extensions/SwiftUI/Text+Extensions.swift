//
//  Text+Extensions.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 20/05/2023.
//

import SwiftUI

extension Text {
    func developerTextStyle(isAnimated: Binding<Bool>) -> some View {
        self
            .font(.title3)
            .fontWeight(.bold)
            .foregroundColor(.accentColor)
            .opacity(isAnimated.wrappedValue ? 1 : 0)
            .offset(y: isAnimated.wrappedValue ? 0 : 40)
            .scaleEffect(isAnimated.wrappedValue ? 1 : 0.6)
    }
    
    func createdByTextStyle(isAnimated: Binding<Bool>) -> some View {
        self
            .font(.callout)
            .foregroundColor(.accentColor)
            .opacity(isAnimated.wrappedValue ? 1 : 0)
            .offset(x: isAnimated.wrappedValue ? 0 : -80)
    }
    
    func rowItemTextView(fontSize: Double?) -> some View {
        self
            .font(.system(size: fontSize ?? Constants.shared.rowItemTitleFontSize))
            .foregroundColor(.accentColor)
            .lineLimit(Constants.shared.textLinLimitForTitle)
    }
    
    func detailsTextViewStyle() -> some View {
        self
            .font(.system(size: Constants.shared.subtitleFontSize))
    }
}
