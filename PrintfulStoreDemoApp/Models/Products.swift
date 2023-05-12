//
//  Products.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 10/05/2023.
//

import Foundation

// MARK: - Welcome
struct Products: Decodable {
    let code: Int
    let result: [Product]
}

// MARK: - Result
struct Product: Decodable, Identifiable {
    let id, mainCategoryID: Int
    let type, typeName, title: String
    let brand: String?
    let model, image: String
    let variantCount: Int
    let currency: String
//    let files: [File]
//    let options: [ResultOption]
    let isDiscontinued: Bool
    let avgFulfillmentTime: Double?
    let description: String
//    let techniques: [Technique]
    let originCountry: String?

    enum CodingKeys: String, CodingKey {
        case id
        case mainCategoryID = "main_category_id"
        case type
        case typeName = "type_name"
        case title, brand, model, image
        case variantCount = "variant_count"
        case currency
//        case files, options
        case isDiscontinued = "is_discontinued"
        case avgFulfillmentTime = "avg_fulfillment_time"
        case description
//        case techniques
        case originCountry = "origin_country"
    }
}

// MARK: - File
struct File: Decodable {
    let type, title, additionalPrice: String
    let options: [FileOption]

    enum CodingKeys: String, CodingKey {
        case type, title
        case additionalPrice = "additional_price"
        case options
    }
}

// MARK: - FileOption
struct FileOption: Decodable {
    let id, type, title: String
    let additionalPrice: Double

    enum CodingKeys: String, CodingKey {
        case id, type, title
        case additionalPrice = "additional_price"
    }
}

// MARK: - ResultOption
struct ResultOption: Decodable {
    let id, title, type: String
    let values: [String: String]?
    let additionalPrice: String
    let additionalPriceBreakdown: [String:String]

    enum CodingKeys: String, CodingKey {
        case id, title, type, values
        case additionalPrice = "additional_price"
        case additionalPriceBreakdown = "additional_price_breakdown"
    }
}

// MARK: - Technique
struct Technique: Decodable {
    let key, displayName: String
    let isDefault: Bool

    enum CodingKeys: String, CodingKey {
        case key
        case displayName = "display_name"
        case isDefault = "is_default"
    }
}
