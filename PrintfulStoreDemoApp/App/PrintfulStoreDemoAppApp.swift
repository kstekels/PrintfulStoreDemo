//
//  PrintfulStoreDemoAppApp.swift
//  PrintfulStoreDemoApp
//
//  Created by Kārlis Štekels on 09/05/2023.
//

import SwiftUI

@main
struct PrintfulStoreDemoAppApp: App {
    
    @StateObject private var storageDataController = StorageDataController()
    
    var body: some Scene {
        WindowGroup {
            LaunchScreenView()
                .environment(\.managedObjectContext, storageDataController.container.viewContext)
        }
    }
}
