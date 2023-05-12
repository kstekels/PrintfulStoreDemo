//
//  ProductDetailView.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 11/05/2023.
//

import SwiftUI

struct ProductDetailView: View {
    
    @Environment (\.managedObjectContext) var managedObjectContext
    @FetchRequest (sortDescriptors: []) var favoriteProducts: FetchedResults<Favorite>
    
    let product: Product
    @State private var isFavorit: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                
                Text(product.title.capitalized)
                    .font(.system(size: 26))
                    .fontWeight(.bold)
                
                AsyncImage(url: URL(string: product.image)) { image in
                    ZStack {
                        image
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(15)
                            .padding(.horizontal)
                    }
                } placeholder: {
                    Image(systemName: "photo")
                }
                .padding(.all, 6)
                
                
                
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        if let brand = product.brand {
                            Text("Brand: \(brand.capitalized)")
                                .font(.system(size: 18))
                        }
                        Text("Model: \(product.model)")
                            .font(.system(size: 18))
                    }
                    Spacer()
                }
                .padding(.horizontal)
                
                
                .padding(.horizontal)
                Text("\(product.description)")
                    .padding(.horizontal)
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            .navigationTitle("Details")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        //MARK: - Implemet to save
                        isFavorit.toggle()
                        if isFavorit {
                            let favorite = Favorite(context: managedObjectContext)
                            favorite.id = UUID()
                            favorite.productId = Int16(product.id)
                            favorite.categoryId = Int16(product.mainCategoryID)
                            do {
                                try managedObjectContext.save()
                            } catch {
                                print(error.localizedDescription)
                            }
                        } else {
                            _ = favoriteProducts.map { product in
                                if product.productId == self.product.id {
                                    managedObjectContext.delete(product)
                                    isFavorit = false
                                }
                                return product
                            }
                        }
                    } label: {
                        isFavorit ? TabBarIcons.hearFill : TabBarIcons.heart
                    }
                }
            }
            .onAppear {
                isFavorit = favoriteProducts.contains { favorite in
                    favorite.productId == self.product.id
                }
            }
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProductDetailView(product: Product(id: 638, mainCategoryID: 42, type: "EMBROIDERY", typeName: "Hat", title: "adidas Dad Hat", brand: "adidas", model: "HA9264", image: "https://files.cdn.printful.com/o/upload/product-catalog-img/90/90cbf5ffea4c69b1753666debb614a66_l", variantCount: 1, currency: "USD", isDiscontinued: false, avgFulfillmentTime: nil, description: "This adidas dad hat is a timeless and stylish piece, perfect for any wardrobe. Plus, thanks to an adjustable snapback closure and flexible material, it has an extra comfortable fit.\n\n• Made from 100% recycled polyester\n• Unstructured\n• 6-panel, low-profile\n• One size fits all\n• Adjustable snapback closure", originCountry: "US"))
        }
    }
}
