//
//  Products.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 10/05/2023.
//

import Foundation

// MARK: - Welcome
struct Products: Codable {
    let code: Int
    let result: [Product]
}

// MARK: - Result
struct Product: Codable, Identifiable {
    let id, mainCategoryID: Int
    let type, typeName, title: String
    let brand: String?
    let model, image: String
    let variantCount: Int
    let currency: String
    let isDiscontinued: Bool
    let avgFulfillmentTime: Double?
    let description: String
    let originCountry: String?

    enum CodingKeys: String, CodingKey {
        case id
        case mainCategoryID = "main_category_id"
        case type
        case typeName = "type_name"
        case title, brand, model, image
        case variantCount = "variant_count"
        case currency
        case isDiscontinued = "is_discontinued"
        case avgFulfillmentTime = "avg_fulfillment_time"
        case description
        case originCountry = "origin_country"
    }
}
