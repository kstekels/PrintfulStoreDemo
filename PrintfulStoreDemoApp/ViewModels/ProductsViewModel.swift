//
//  ProductsViewModel.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 10/05/2023.
//

import Foundation

class ProductsViewModel: ObservableObject {
    @Published var products = [Product]()
    @Published var isProductsAvailable: Bool = false
}

extension ProductsViewModel {
    
    func getProductsBy(id categoryID: Int) {
        StoreService.shared.fetchData(url: URL.urlForAllProducts(), authToken: authToken) { (result: Result<Products, NetworkError>) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.products = response.result.filter({ $0.mainCategoryID == categoryID })
                    
                    if !self.products.isEmpty {
                        self.isProductsAvailable = true
                    } else {
                        self.isProductsAvailable = false
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
