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
        StoreNetworkService.shared.fetchData(url: URL.urlForAllCategories(), authToken: Constants.shared.authToken) { (result: Result<CategoriesResponse, NetworkError>) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.categories = response.result.categories
                }
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
    
}
