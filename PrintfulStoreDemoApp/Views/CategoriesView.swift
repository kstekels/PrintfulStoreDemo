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
            List {
                ForEach(categoriesVM.categories) { category in
                    Text(category.title)
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
