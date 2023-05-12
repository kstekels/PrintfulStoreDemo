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
    case noToken
}

class StoreNetworkService {
    
    private init() { }
    
    static let shared = StoreNetworkService()
    
    func fetchData<T: Decodable>(url: URL?, authToken: String?, completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let url = url else {
            return completion(.failure(.badURL))
        }
        guard let authToken = authToken else {
            return completion(.failure(.noToken))
        }
        var request = URLRequest(url: url)
        request.addValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            let dataResponse = try? JSONDecoder().decode(T.self, from: data)
            if let categoriesResponse = dataResponse {
                completion(.success(categoriesResponse))
            } else {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
