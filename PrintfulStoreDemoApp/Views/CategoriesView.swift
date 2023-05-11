//
//  CategoriesView.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 09/05/2023.
//

import SwiftUI

struct CategoriesView: View {
    
    @ObservedObject var categoriesVM = CategoriesViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack(alignment: .leading, spacing: 0) {
                    ForEach(categoriesVM.categories) { category in
                        NavigationLink {
                            ProductsView()
                        } label: {
                            CategoryRowItemView(category: category)
                        }
                    }
                }
            }
            .navigationTitle("Categories")
        }
        .onAppear {
            categoriesVM.getCategories()
        }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
