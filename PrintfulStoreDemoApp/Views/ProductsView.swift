//
//  CategoryProductsView.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 09/05/2023.
//

import SwiftUI
import CoreData

struct ProductsView: View {
    
    @ObservedObject var productsVM = ProductsViewModel()
    @State private var isLoading: Bool = false
    let category: Category
    
    var body: some View {
        NavigationStack {
            GeometryReader { reader in
                ScrollView(showsIndicators: false) {
                    if !productsVM.isContentLoading && !productsVM.isProductsReceived {
                        HStack(alignment: .center) {
                            Spacer()
                            EmptyInfoScreen(message: Constants.shared.noProductsFound, image: .xmark)
                            Spacer()
                        }
                        .frame(width: reader.size.width, height: reader.size.height)
                    }
                    else if isLoading {
                        ProgressView()
                            .defaultStyleWithFrame(frameWidth: reader.size.width, frameHeight: reader.size.height)
                    } else {
                        LazyVStack {
                            ForEach(productsVM.products) { product in
                                NavigationLink {
                                    ProductDetailView(product: product, onDismiss: {}, isParentFavorites: false)
                                } label: {
                                    ProductRowItemView(product: product)
                                }
                            }
                        }
                    }
                }
                .navigationTitle(Constants.shared.products)
                .navigationBarTitleDisplayMode(.inline)
                .onAppear {
                    fetchProducts()
                }
            }
        }
    }
    
    private func fetchProducts() {
        isLoading = true
        productsVM.getProductsBy(id: category.id)
        delayExecution {
            isLoading = false
        }
    }
}

struct CategoryProductsView_Previews: PreviewProvider {
    
    static let productDetail = PreviewData.shared.categories[1]
    static let products = PreviewData.shared.products
    
    static var previews: some View {
        ProductsView(category: productDetail)
    }
}
