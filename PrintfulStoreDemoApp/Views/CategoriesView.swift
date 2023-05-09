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
                ForEach(categoriesVM.categories) { category in
                    CategoryRowItemView(category: category)
                }
                .navigationTitle("Categories")
            }
            .listStyle(.plain)
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
