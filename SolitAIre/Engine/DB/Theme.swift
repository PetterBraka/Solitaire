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

    public var cardStyle: CardStyle = CardStyle.modern

    init(cardTintHeart: CodableColor, cardTintDimmond: CodableColor, cardTintSpade: CodableColor, cardTintClub: CodableColor, cardOutline: CodableColor, cardStyle: CardStyle) {
        self.cardTintHeart = cardTintHeart
        self.cardTintDimmond = cardTintDimmond
        self.cardTintSpade = cardTintSpade
        self.cardTintClub = cardTintClub
        self.cardOutline = cardOutline
        self.cardStyle = cardStyle
    }
}

extension Theme {
    convenience init() {
        self.init(
            cardTintHeart: .init(from: .red),
            cardTintDimmond: .init(from: .red),
            cardTintSpade: .init(from: .black),
            cardTintClub: .init(from: .black),
            cardOutline: .init(from: .black),
            cardStyle: .oldSchool
        )
    }
}
