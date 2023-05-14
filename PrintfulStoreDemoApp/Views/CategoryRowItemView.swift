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
    static var previews: some View {
        CategoryRowItemView(category: Category(id: 1, parentId: 1, imageURL: "https://files.cdn.printful.com/o/upload/catalog_category/fb/fbf0cf796a5603666e85713ece1708a1_t?v=1680080851", catalogPosition: 1, size: .medium, title: "Men's clothing"), isLoading: .constant(true))
    }
}
