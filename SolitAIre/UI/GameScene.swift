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
    
    init(game: SaveData) {
        self.game = game
    }
    
    public var body: some View {
        ZStack(alignment: .top) {
            Color.green
                .overlay(Color.black.opacity(0.5))
                .ignoresSafeArea()
            
            HStack(spacing: 10) {
                ForEach(game.board, id: \.hashValue) { column in
                    if column.isEmpty {
                        CardView(card: .empty)
                    } else {
                        ForEach(column, id: \.hashValue) { card in
                            let tint: Color = switch card.suit {
                            case .diamonds, .hearts: .red
                            case .clubs, .spades, .empty: .black
                            }
                            CardView(card: card) {
                                Color.white
                            }
                            .foregroundStyle(tint)
                        }
                    }
                }
            }
            .padding(20)
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

#Preview {
    GameScene(
        game: .init(
            startDate: .now,
            endDate: nil,
            score: .init(name: nil, score: 0, time: 0),
            board: [
                [Card(suit: .hearts, rank: .ace)],
                [],
                [],
                [],
                [Card(suit: .hearts, rank: .one)],
                [Card(suit: .spades, rank: .two)],
                [],
            ],
            deck: [.init(suit: .diamonds, rank: .five)]
        )
    )
}
