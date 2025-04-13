//
//  Card.swift
//  SolitAIre
//
//  Created by Petter vang Brakalsvålet on 13/04/2025.
//

public struct Card: Codable, Hashable, Sendable {
    public var suit: Suit
    public var rank: Rank
    
    public enum Suit: String, Codable, Sendable, CaseIterable {
        case clubs = "suit.club"
        case diamonds = "suit.diamond"
        case hearts = "suit.heart"
        case spades = "suit.spade"
        
        var symbol: String { rawValue }
    }
    
    public enum Rank: String, Codable, Sendable, CaseIterable {
        case one = "1"
        case two = "2"
        case three = "3"
        case four = "4"
        case five = "5"
        case six = "6"
        case seven = "7"
        case eight = "8"
        case nine = "9"
        case ten = "10"
        case jack = "J"
        case queen = "Q"
        case king = "K"
        case ace = "A"
        
        var symbol: String { rawValue }
    }
}

extension Card {
    static let fullDeck: [Card] = {
        Card.Suit.allCases.flatMap { suit in
            Card.Rank.allCases.map { rank in
                Card(suit: suit, rank: rank)
            }
        }.shuffled()
    }()
}
