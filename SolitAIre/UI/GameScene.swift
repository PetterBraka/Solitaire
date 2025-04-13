//
//  GameScene.swift
//  SolitAIre
//
//  Created by Petter vang Brakalsvålet on 13/04/2025.
//

import SwiftUI
import SwiftData

public struct GameScene: View {
    @Environment(\.modelContext) private var modelContext
    public var game: SaveData
    
    public var body: some View {
        VStack {
            Text(game.id.description)
        }
        .onDisappear {
            modelContext.insert(game)
            do {
                try modelContext.save()
            } catch {
                print(error)
            }
        }
    }
}
