//
//  ItemImageView.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 14/05/2023.
//

import SwiftUI

struct RowItemImageView: View {
    
    let imageURL: String
    
    var body: some View {
        AsyncImage(url: URL(string: imageURL)) { image in
            ZStack {
                image
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(Constants.shared.cornerRadius)
                
            }
        } placeholder: {
            Images.photo
        }
        .frame(
            width: Constants.shared.itemImageWidth,
            height: Constants.shared.itemImageHeight
        )
    }
}
