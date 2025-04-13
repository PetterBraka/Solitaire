//
//  SaveData.swift
//  SolitAIre
//
//  Created by Petter vang Brakalsvålet on 13/04/2025.
//

import Foundation
import SwiftData

@Model
public final class SaveData: Hashable {
    #Unique<SaveData>([\.id])
    
    @Attribute(.unique)
    public var id: String
    
    public var startDate: Date
    public var endDate: Date?
    
    @Relationship(deleteRule: .cascade, minimumModelCount: 1, maximumModelCount: 1)
    public var score: HighScore
    public var board: [[Card]]
    public var deck: [Card]
    
    public init(id: String = UUID().uuidString, startDate: Date, endDate: Date?, score: HighScore, board: [[Card]], deck: [Card]) {
        self.id = id
        self.startDate = startDate
        self.endDate = endDate
        self.score = score
        self.board = board
        self.deck = deck
    }
}
