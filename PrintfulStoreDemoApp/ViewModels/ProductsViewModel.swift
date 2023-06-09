//
//  ProductsViewModel.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 10/05/2023.
//

import Foundation

class ProductsViewModel: ObservableObject {
    @Published var products = [Product]()
    @Published var isProductsReceived: Bool = false
    @Published var isContentLoading: Bool = true
}

extension ProductsViewModel {
    
    func getProductsBy(id categoryID: Int) {
        StoreNetworkService.shared.fetchData(url: URL.urlForAllProducts(), authToken: Constants.shared.authToken) { (result: Result<Products, NetworkError>) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.products = response.result.filter({ $0.mainCategoryID == categoryID })
                    self.isProductsReceived = !self.products.isEmpty
                    self.isContentLoading = false
                }
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
    
}
