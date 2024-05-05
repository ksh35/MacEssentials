//
//  MacEssentialsApp.swift
//  MacEssentials
//
//  Created by Krish Meghani on 4/2/24.
//

import SwiftUI

@main
struct MacEssentialsApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ConfigureView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }

        MenuBarExtra("main", systemImage: "folder") {
            MainView()
        }.menuBarExtraStyle(.window)

    }
    private func loadSettings(){
        
    }
}
