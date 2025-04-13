//
//  SolitAIreApp.swift
//  SolitAIre
//
//  Created by Petter vang Brakalsvålet on 13/04/2025.
//

import SwiftUI
import CoreData
import SwiftData

@main
struct SolitAIreApp: App {
    var modelContainer: ModelContainer
    
    init() {
        let config = ModelConfiguration(
            allowsSave: true,
            groupContainer: .identifier("group.petter.braka.SolitAIre"),
            cloudKitDatabase: .none // .private("iCloud.com.petter.braka.SolitAIre")
        )
        
        do {
            modelContainer = try ModelContainer(for: HighScore.self, SaveData.self, configurations: config)
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }

    var body: some Scene {
        WindowGroup {
            MainMenu()
        }
        .modelContainer(modelContainer)
    }
}
