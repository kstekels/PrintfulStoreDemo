//
//  ProductsViewModel.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 10/05/2023.
//

import Foundation

class ProductsViewModel: ObservableObject {
    @Published var products = [Product]()
}

extension ProductsViewModel {
    
    func getProducts() {
        StoreService.shared.fetchData(url: URL.urlForAllProducts(), authToken: authToken) { (result: Result<Products, NetworkError>) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.products = response.result
//                    print(response.result.count)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
