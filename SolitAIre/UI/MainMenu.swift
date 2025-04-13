//
//  MainMenu.swift
//  SolitAIre
//
//  Created by Petter vang Brakalsvålet on 13/04/2025.
//

import SwiftUI
import SwiftData

struct MainMenu: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var saves: [SaveData]

    var body: some View {
        NavigationView {
            VStack {
                if let currentSave = saves.first(where: { $0.endDate == nil }) {
                    Button("Continue Game") {
                        print("Continuing game with save ID: \(currentSave.id)")
                    }
                }
                Button("New Game") {
                }
            }
            .navigationTitle("SolitAIre")
        }
    }
}

#Preview {
    MainMenu()
        .modelContainer(for: [HighScore.self, SaveData.self], inMemory: true)
}
