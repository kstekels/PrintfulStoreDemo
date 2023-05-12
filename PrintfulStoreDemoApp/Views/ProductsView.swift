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
    let category: Category

    var body: some View {
        NavigationStack {
            GeometryReader { reader in
                ScrollView(showsIndicators: false) {
                    if productsVM.isProductsAvailable {
                        LazyVStack {
                            ForEach(productsVM.products) { product in
                                NavigationLink {
                                    ProductDetailView(product: product)
                                } label: {
                                    ProductRowItemView(product: product)
                                }
                            }
                        }
                    } else {
                        ProgressView()
                            .scaleEffect(1.5)
                            .frame(width: reader.size.width, height: reader.size.height)
                    }
                }
                .navigationTitle("Products")
                .navigationBarTitleDisplayMode(.inline)
                .onAppear {
                    productsVM.getProductsBy(id: category.id)
            }
            }
        }
    }
}

struct CategoryProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView(category: Category(id: 1, parentId: 1, imageURL: "https://files.cdn.printful.com/o/upload/catalog_category/fb/fbf0cf796a5603666e85713ece1708a1_t?v=1680080851", catalogPosition: 1, size: .medium, title: "Men's clothing"))
    }
}
