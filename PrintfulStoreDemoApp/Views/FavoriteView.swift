//
//  FavoriteItemsView.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 09/05/2023.
//

import SwiftUI

struct FavoriteView: View {
    
    @FetchRequest (sortDescriptors: []) var products: FetchedResults<Favorite>
    @ObservedObject private var favoriteProductsViewModel = FavoriteProductsViewModel()
    
    var body: some View {
        NavigationStack {
            if !favoriteProductsViewModel.products.isEmpty {
                ScrollView(showsIndicators: false) {
                    LazyVStack {
                        ForEach(favoriteProductsViewModel.products) { product in
                            NavigationLink {
                                ProductDetailView(product: product)
                            } label: {
                                ProductRowItemView(product: product)
                            }
                        }
                    }
                }
            } else {
                Text("No Favorite Products in list")
            }
        }
        .onAppear{
            let favoritProdcutsIds = products.map({ product in
                return product.productId
            })
            favoriteProductsViewModel.getProductsBy(ids: favoritProdcutsIds)
        }
    }
}

struct FavoriteItemsView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
