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
            cloudKitDatabase: .private("iCloud.com.petter.braka.SolitAIre")
        )
        
        do {
#if DEBUG
            // Use an autorelease pool to make sure Swift deallocates the persistent
            // container before setting up the SwiftData stack.
            try autoreleasepool {
                let storeDescription = NSPersistentStoreDescription(url: config.url)
                let options = NSPersistentCloudKitContainerOptions(containerIdentifier: "iCloud.com.petter.braka.SolitAIre")
                storeDescription.cloudKitContainerOptions = options
                // Load the store synchronously so it completes before initializing the
                // CloudKit schema.
                storeDescription.shouldAddStoreAsynchronously = false
                if let managedObject = NSManagedObjectModel.makeManagedObjectModel(for: [HighScore.self, SaveData.self]) {
                    let container = NSPersistentCloudKitContainer(name: "SolitAIre", managedObjectModel: managedObject)
                    container.persistentStoreDescriptions = [storeDescription]
                    container.loadPersistentStores {_, err in
                        if let err {
                            fatalError(err.localizedDescription)
                        }
                    }
                    // Initialize the CloudKit schema after the store finishes loading.
                    try container.initializeCloudKitSchema()
                    // Remove and unload the store from the persistent container.
                    if let store = container.persistentStoreCoordinator.persistentStores.first {
                        try container.persistentStoreCoordinator.remove(store)
                    }
                }
            }
#endif
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
