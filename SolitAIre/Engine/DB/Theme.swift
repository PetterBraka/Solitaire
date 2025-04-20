//
//  Theme.swift
//  SolitAIre
//
//  Created by Petter Braka on 20/04/2025.
//

import Foundation
import SwiftData
import SwiftUI

@Model
public final class Theme: Identifiable {
    
    public var cardTintHeart: CodableColor
    public var cardTintDimmond: CodableColor
    public var cardTintSpade: CodableColor
    public var cardTintClub: CodableColor
    public var cardOutline: CodableColor

    public var cardStyle: CardStyle
    
    init(
        cardTintHeart: CodableColor = .init(from: .red),
        cardTintDimmond: CodableColor = .init(from: .red),
        cardTintSpade: CodableColor = .init(from: .black),
        cardTintClub: CodableColor = .init(from: .black),
        cardOutline: CodableColor = .init(from: .black),
        cardStyle: CardStyle = .old
    ) {
        self.cardTintHeart = cardTintHeart
        self.cardTintDimmond = cardTintDimmond
        self.cardTintSpade = cardTintSpade
        self.cardTintClub = cardTintClub
        self.cardOutline = cardOutline
        self.cardStyle = cardStyle
    }
}
