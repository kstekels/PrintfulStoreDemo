//
//  FavoriteProductsViewModel.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 12/05/2023.
//

import Foundation

class FavoriteProductsViewModel: ObservableObject {
    @Published var products = [Product]()
    @Published var isProductsSaved: Bool = false
    @Published var isLoading: Bool = true
}

extension FavoriteProductsViewModel {
    func getProductsBy(ids productIds: [Int16]) {
        StoreNetworkService.shared.fetchData(url: URL.urlForAllProducts(), authToken: Constants.shared.authToken) { (result: Result<Products, NetworkError>) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.products = response.result.filter { product in
                        productIds.contains(Int16(product.id))
                    }
                    self.isProductsSaved = !self.products.isEmpty
                    self.isLoading = false
                }
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
}
