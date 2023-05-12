//
//  FavoriteProductsViewModel.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 12/05/2023.
//

import Foundation

class FavoriteProductsViewModel: ObservableObject {
    @Published var products = [Product]()
}

extension FavoriteProductsViewModel {
    func getProductsBy(ids productIds: [Int16]) {
        StoreNetworkService.shared.fetchData(url: URL.urlForAllProducts(), authToken: authToken) { (result: Result<Products, NetworkError>) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.products = response.result.filter { product in
                        productIds.contains(Int16(product.id))
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
