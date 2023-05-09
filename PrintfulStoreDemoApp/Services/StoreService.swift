//
//  StoreService.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 09/05/2023.
//

import Foundation


enum NetworkError: Error {
    case badURL
    case decodingError
    case noData
}

class StoreService {
    
    private init() { }
    
    static let shared = StoreService()
    
    func getCategories(completion: @escaping (Result<CategoriesResponse, NetworkError>) -> Void) {
        guard let url = URL.urlForAllCategories() else {
            return completion(.failure(.badURL))
        }
        var request = URLRequest(url: url)
        request.addValue("Bearer FA3dfYHVOHPTWb833EadtKrr6KsmIHIkNVo9LGAH", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            let categoriesResponse = try? JSONDecoder().decode(CategoriesResponse.self, from: data)
            if let categoriesResponse = categoriesResponse {
                completion(.success(categoriesResponse))
            } else {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
