//
//  String+Extensions.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 25/05/2023.
//

import Foundation

extension String {
    func splitString() -> [String]? {
        let result = self.split(separator: "|").map { String($0) }
        return result
    }
}
