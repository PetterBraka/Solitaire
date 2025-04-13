//
//  Card.swift
//  SolitAIre
//
//  Created by Petter vang Brakalsvålet on 13/04/2025.
//

public struct Card: Codable, Hashable, Sendable {
    public var suite: Suite
    public var rank: Rank
    
    public enum Suite: String, Codable, Sendable, CaseIterable {
        case clubs
        case diamonds
        case hearts
        case spades
    }
    
    public enum Rank: String, Codable, Sendable, CaseIterable {
        case one
        case two
        case three
        case four
        case five
        case six
        case seven
        case eight
        case nine
        case ten
        case jack
        case queen
        case king
        case ace
    }
}

extension Card {
    static let fullDeck: [Card] = {
        Card.Suite.allCases.flatMap { suite in
            Card.Rank.allCases.map { rank in
                Card(suite: suite, rank: rank)
            }
        }.shuffled()
    }()
}
