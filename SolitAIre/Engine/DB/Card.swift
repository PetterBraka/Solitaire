//
//  Card.swift
//  SolitAIre
//
//  Created by Petter vang Brakalsvålet on 13/04/2025.
//

public struct Card: Codable, Hashable {
    public var suite: Suite
    public var rank: Rank
    
    public enum Suite: String, Codable, Hashable {
        case clubs
        case diamonds
        case hearts
        case spades
    }
    
    public enum Rank: String, Codable, Hashable {
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
