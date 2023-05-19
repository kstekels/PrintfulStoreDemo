//
//  CategoryListItemView.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 09/05/2023.
//

import SwiftUI

struct CategoryRowItemView: View {
    
    let category: Category
    @Binding var isLoading: Bool
    
    var body: some View {
        
        SkeletonRowItem(content: {
            HStack(alignment: .center, spacing: Constants.shared.cornerRadius) {
                RowItemImageView(imageURL: category.imageURL)
                
                RowItemTitleView(title: category.title)
                
                Spacer()
            }
        }, isLoading: $isLoading)
    }
}

struct CategoryListItemView_Previews: PreviewProvider {
    
    static let category = PreviewData.shared.categories[1]
    
    static var previews: some View {
        CategoryRowItemView(category: category, isLoading: .constant(true))
    }
}
