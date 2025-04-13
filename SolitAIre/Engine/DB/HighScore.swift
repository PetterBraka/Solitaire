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
    #Unique<HighScore>([\.id, \.name])
    
    public var id: String
    public var name: String?
    public var score: Int
    public var time: TimeInterval
    
    init(id: String = UUID().uuidString, name: String?, score: Int, time: TimeInterval) {
        self.id = id
        self.name = name
        self.score = score
        self.time = time
    }
}
