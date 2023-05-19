//
//  ProductRowItemView.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 11/05/2023.
//

import SwiftUI

struct ProductRowItemView: View {
    
    let product: Product
    
    var body: some View {
        HStack(alignment: .center, spacing: Constants.shared.cornerRadius) {
            RowItemImageView(imageURL: product.image)
            
            RowItemTitleView(title: product.title.capitalized, fontSize: Constants.shared.rowItemTitleFontSize)
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct ProductRowItemView_Previews: PreviewProvider {
    
    static let product = PreviewData.shared.products[0]
    
    static var previews: some View {
        ProductRowItemView(product: product)
    }
}
