//
//  MacEssentialsApp.swift
//  MacEssentials
//
//  Created by Krish Meghani on 4/8/24.
//

import SwiftUI

@main
struct MacEssentialsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
