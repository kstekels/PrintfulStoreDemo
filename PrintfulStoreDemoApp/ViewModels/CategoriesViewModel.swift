//
//  CategoriesViewModel.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 09/05/2023.
//

import Foundation

class CategoriesViewModel: ObservableObject {
    @Published var categories = [Category]()
}

extension CategoriesViewModel {
    
    func getCategories() {
        StoreService.shared.getCategories { result in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
