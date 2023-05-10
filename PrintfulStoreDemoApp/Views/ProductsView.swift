//
//  CategoryProductsView.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 09/05/2023.
//

import SwiftUI

struct ProductsView: View {
    
    @ObservedObject var productsVM = ProductsViewModel()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack {
                ForEach(productsVM.products) { product in
                    Text("\(product.title)")
                }
            }
                
        }
        .onAppear{
            productsVM.getProducts()
        }
    }
}

struct CategoryProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
    }
}
