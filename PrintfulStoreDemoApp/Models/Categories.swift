//
//  Categories.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 09/05/2023.
//

import Foundation

struct CategoriesResponse: Decodable {
    let code: Int
    let result: Categories
    
    enum CodingKeys: String, CodingKey {
        case code
        case result
    }
}

struct Categories: Decodable {
    let categories: [Category]
    
    enum CodingKeys: String, CodingKey {
        case categories
    }
}

struct Category: Decodable, Identifiable {
    let id: Int
    let parentId: Int
    let imageURL: String
    let catalogPosition: Int
    let size: SizeOfCategoryImage
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case parentId = "parent_id"
        case imageURL = "image_url"
        case catalogPosition = "catalog_position"
        case size
        case title
    }
}
