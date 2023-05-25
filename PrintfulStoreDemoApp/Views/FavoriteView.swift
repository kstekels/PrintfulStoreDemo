//
//  FavoriteItemsView.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 09/05/2023.
//

import SwiftUI

struct FavoriteView: View {
    
    @Environment (\.managedObjectContext) var managedObjectContext
    @FetchRequest (sortDescriptors: [
        SortDescriptor(\.categoryId),
    ]) var products: FetchedResults<Favorite>
    @ObservedObject private var favoriteProductsViewModel = FavoriteProductsViewModel()
    @State var isLoading: Bool = false
    @State var itemsInFavorites: Int = 0
    @State private var showConfirmationAlert = false
    @State private var isFavoriteHasChanges: Bool = false
    
    var body: some View {
        NavigationStack {
            if !favoriteProductsViewModel.isProductsSaved && !favoriteProductsViewModel.isLoading {
                EmptyInfoScreen(message: Constants.shared.noProductsSaved, image: .heartCircle)
            }
            else if favoriteProductsViewModel.isProductsSaved {
                ScrollView(showsIndicators: false) {
                    VStack {
                        ForEach(favoriteProductsViewModel.products) { product in
                            NavigationLink {
                                ProductDetailView(product: product, onDismiss: fetchFavorites, isParentFavorites: true)
                            } label: {
                                ProductRowItemView(product: product)
                            }
                        }
                    }
                }
                .navigationTitle(Constants.shared.favorites)
                .disabled(isFavoriteHasChanges)
                .overlay {
                    if isFavoriteHasChanges {
                        ProgressView()
                            .defaultStyle()
                    }
                }
                
            } else {
                ProgressView()
                    .defaultStyle()
            }
        }
        .alert(isPresented: $showConfirmationAlert) {
            Alert(title: Text(Constants.shared.deleted), message: Text(Constants.shared.itemHasDeletedFromStorage), dismissButton: .destructive(Text(Constants.shared.close), action: {
                reloadPage()
            }))
        }
        .onChange(of: products) { newValue in
            if itemsInFavorites > newValue.count {
                showConfirmationAlert = true
            } else if itemsInFavorites < newValue.count {
                reloadPage()
            }
        }
        .onAppear{
            fetchFavorites()
        }
    }
    
    private func reloadPage() {
        isFavoriteHasChanges = true
        delayExecution(with: 2) {
            isFavoriteHasChanges = false
        }
    }
    
    private func fetchFavorites() {
        isLoading = true
        itemsInFavorites = products.count
        let favoritProdcutsIds = products.map({ product in
            return product.productId
        })
        favoriteProductsViewModel.getProductsBy(ids: favoritProdcutsIds)
        delayExecution {
            isLoading = false
        }
    }
}

struct FavoriteItemsView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
