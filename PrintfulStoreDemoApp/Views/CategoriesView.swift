//
//  CategoriesView.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 09/05/2023.
//

import SwiftUI

struct CategoriesView: View {
    
    @ObservedObject var categoriesVM = CategoriesViewModel()
    @State var isLoading: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack(alignment: .leading) {
                    ForEach(categoriesVM.categories) { category in
                        NavigationLink {
                            ProductsView(category: category)
                        } label: {
                            CategoryRowItemView(category: category, isLoading: $isLoading)
                        }
                        .disabled(isLoading)
                    }
                }
            }
            .navigationTitle(Constants.shared.categories)
        }
        .onAppear {
            isLoading = true
            categoriesVM.getCategories()
            delayExecution {
                isLoading = false
            }
        }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
