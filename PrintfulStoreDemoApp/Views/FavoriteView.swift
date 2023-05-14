//
//  FavoriteItemsView.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 09/05/2023.
//

import SwiftUI

struct FavoriteView: View {
    
    @Environment (\.managedObjectContext) var managedObjectContext
    @FetchRequest (sortDescriptors: []) var products: FetchedResults<Favorite>
    @ObservedObject private var favoriteProductsViewModel = FavoriteProductsViewModel()
    @State var isLoading: Bool = false
    
    var body: some View {
        NavigationStack {
            if !favoriteProductsViewModel.isProductsSaved && !favoriteProductsViewModel.isLoading {
                EmptyInfoScreen(message: "No products saved", image: .heartCircle)
            }
            else if favoriteProductsViewModel.isProductsSaved {
                ScrollView(showsIndicators: false) {
                    LazyVStack {
                        ForEach(favoriteProductsViewModel.products) { product in
                            NavigationLink {
                                ProductDetailView(onDismiss: fetchFavorites, product: product)
                            } label: {
                                ProductRowItemView(product: product)
                            }
                        }
                    }
                }
            } else {
                ProgressView()
                    .scaleEffect(1.5)
            }
        }
        .onAppear{
            fetchFavorites()
        }
    }
    
    private func fetchFavorites() {
        isLoading = true
        let favoritProdcutsIds = products.map({ product in
            return product.productId
        })
        favoriteProductsViewModel.getProductsBy(ids: favoritProdcutsIds)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isLoading = false
        }
    }
}

struct FavoriteItemsView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
