//
//  CategoryListItemView.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 09/05/2023.
//

import SwiftUI

struct CategoryRowItemView: View {
    
    let category: Category
    
    var body: some View {
        HStack(alignment: .center, spacing: 25) {
            AsyncImage(url: URL(string: category.imageURL)) { image in
                ZStack {
                    image
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(15)
                        .padding()
                }
            } placeholder: {
                Image(systemName: "photo")
            }
            .frame(width: 150, height: 150)
            Text(category.title)
                .font(.system(size: 20))
            Spacer()
        }

    }
}

struct CategoryListItemView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRowItemView(category: Category(id: 1, parentId: 1, imageURL: "https://files.cdn.printful.com/o/upload/catalog_category/fb/fbf0cf796a5603666e85713ece1708a1_t?v=1680080851", catalogPosition: 1, size: .medium, title: "Men's clothing"))
    }
}
