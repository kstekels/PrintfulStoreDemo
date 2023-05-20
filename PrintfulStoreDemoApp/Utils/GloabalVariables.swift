//
//  GloabalVariables.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 19/05/2023.
//

import Foundation

final class GlobalVariables {
    
    static let shared = GlobalVariables()
    
    var categoryID: Int? = nil
    
    private init() {}
}

let globals = GlobalVariables.shared
