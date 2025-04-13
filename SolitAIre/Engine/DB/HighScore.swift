//
//  HighScore.swift
//  SolitAIre
//
//  Created by Petter vang Brakalsvålet on 13/04/2025.
//

import Foundation
import SwiftData

@Model
public final class HighScore: Hashable {
    public var id: String = UUID().uuidString
    public var name: String?
    public var score: Int = 0
    public var time: TimeInterval = 0
    
    @Relationship(deleteRule: .cascade, minimumModelCount: 1, maximumModelCount: 1)
    public var save: SaveData?
    
    init(name: String?, score: Int, time: TimeInterval) {
        self.name = name
        self.score = score
        self.time = time
    }
}
