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
        NavigationStack {
            VStack(spacing: 16) {
                Spacer()
                if let currentSave = saves.first(where: { $0.endDate == nil }) {
                    NavigationLink("Continue Game", value: currentSave)
                }
                NavigationLink("New Game", value: SaveData(
                    startDate: .now,
                    endDate: nil,
                    score: .init(name: nil, score: 0, time: 0),
                    board: [],
                    deck: Card.fullDeck
                ))
            }
            .padding(16)
            .buttonStyle(MainMenuButtonStyle())
            .navigationTitle("SolitAIre")
            .navigationDestination(for: SaveData.self) { save in
                GameScene(game: save)
            }
        }
    }
}

#Preview {
    MainMenu()
        .modelContainerPreview()
}
