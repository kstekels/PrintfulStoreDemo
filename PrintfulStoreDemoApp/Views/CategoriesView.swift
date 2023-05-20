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
    @Binding var isFirstTimeLoaded: Bool
    
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
            fetchCategories()
        }
    }
    
    private func fetchCategories() {
        if isFirstTimeLoaded {
            isLoading = true
            categoriesVM.getCategories()
            delayExecution {
                isLoading = false
            }
            isFirstTimeLoaded = false
        }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView(isFirstTimeLoaded: .constant(true))
    }
}
