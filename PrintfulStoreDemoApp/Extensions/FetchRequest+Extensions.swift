//
//  FetchRequest+Extensions.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 20/05/2023.
//

import SwiftUI
import CoreData

extension FetchedResults: Equatable where Element: NSManagedObject {
    public static func == (lhs: FetchedResults<Element>, rhs: FetchedResults<Element>) -> Bool {
        guard lhs.count == rhs.count else {
            return false
        }
        
        let lhsObjectIDs = lhs.map { $0.objectID }
        let rhsObjectIDs = rhs.map { $0.objectID }
        
        return lhsObjectIDs == rhsObjectIDs
    }
}
