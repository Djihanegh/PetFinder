//
//  PetFinderApp.swift
//  PetFinder
//
//  Created by MAC on 8/9/2025.
//

import SwiftUI

@main
struct PetFinderApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
