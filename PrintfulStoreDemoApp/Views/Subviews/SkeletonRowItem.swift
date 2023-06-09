//
//  SkeletonViewForRowItem.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 14/05/2023.
//

import SwiftUI
import SkeletonUI

struct SkeletonRowItem<Content:View>: View {
    
    @ViewBuilder var content: Content
    @Binding var isLoading: Bool
    
    var body: some View {
        content
            .skeleton(with: isLoading, size: CGSize(width: UIScreen.main.bounds.width / 1.1, height: Constants.shared.itemImageHeight), animated: .linear).shape(type: .rounded(.radius(Constants.shared.cornerRadius, style: .continuous)))
            .padding(.horizontal)
            .padding(.vertical, Constants.shared.verticalPadding)
    }
}
