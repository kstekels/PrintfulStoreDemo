//
//  URL+Extensions.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 09/05/2023.
//

import Foundation

extension URL {
    
    static func urlForAllCategories() -> URL? {
         return URL(string: "https://api.printful.com/categories")
    }
    
}
