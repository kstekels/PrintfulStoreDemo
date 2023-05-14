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
        HStack(alignment: .center, spacing: 15) {
            AsyncImage(url: URL(string: product.image)) { image in
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
            VStack(alignment: .leading, spacing: 6) {
                Text(product.title.capitalized)
                    .font(.system(size: 18))
                    .foregroundColor(.accentColor)
            }
            Spacer()
        }
    }
}

struct ProductRowItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProductRowItemView(product: Product(id: 638, mainCategoryID: 42, type: "EMBROIDERY", typeName: "Hat", title: "adidas Dad Hat", brand: "adidas", model: "HA9264", image: "https://files.cdn.printful.com/o/upload/product-catalog-img/90/90cbf5ffea4c69b1753666debb614a66_l", variantCount: 1, currency: "USD", isDiscontinued: false, avgFulfillmentTime: nil, description: "This adidas dad hat is a timeless and stylish piece, perfect for any wardrobe. Plus, thanks to an adjustable snapback closure and flexible material, it has an extra comfortable fit.\n\n• Made from 100% recycled polyester\n• Unstructured\n• 6-panel, low-profile\n• One size fits all\n• Adjustable snapback closure", originCountry: "US"))
    }
}
