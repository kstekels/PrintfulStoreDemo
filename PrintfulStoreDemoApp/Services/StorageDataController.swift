//
//  StorageDataController.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 12/05/2023.
//

import Foundation
import CoreData

class StorageDataController: ObservableObject {
    let container = NSPersistentContainer(name: "FavoriteProduct")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
