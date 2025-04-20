//
//  CardView.swift
//  SolitAIre
//
//  Created by Petter vang Brakalsvålet on 13/04/2025.
//

import SwiftUI
import SwiftData

public struct CardView<BackgroundView: View>: View {
    let card: Card
    let flipped: Bool
    let theme: Theme
    let backgroundView: () -> BackgroundView
    
    init(
        card: Card,
        flipped: Bool = false,
        theme: Theme,
        backgroundView: @escaping () -> BackgroundView
    ) {
        self.card = card
        self.flipped = flipped
        self.theme = theme
        self.backgroundView = backgroundView
    }
    
    var rank: Text { Text(card.rank.symbol).bold() }
    
    var suit: Image { Image(systemName: card.suit.symbol + ".fill") }
    var tintColor: Color {
        switch card.suit {
        case .hearts: theme.cardTintHeart.toColor()
        case .diamonds: theme.cardTintDimmond.toColor()
        case .spades: theme.cardTintSpade.toColor()
        case .clubs: theme.cardTintClub.toColor()
        case .empty: theme.cardOutline.toColor()
        }
    }

    @State var width: CGFloat = 0
    var cornerRadius: CGFloat { width * 0.05 }
    
    public var body: some View {
        Group {
            if card.suit == .empty {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: width * 0.05)
                    .foregroundStyle(theme.cardOutline.toColor().opacity(0.25))
            } else {
                Group {
                    if flipped {
                        switch theme.cardStyle {
                        case .old:
                            oldBack
                        case .modern:
                            modernBack
                        }
                    } else {
                        switch theme.cardStyle {
                        case .old:
                            oldFace
                        case .modern:
                            modernFace
                        }
                    }
                }
                .frame(maxHeight: .infinity)
                .padding(width * 0.05)
                .background {
                    backgroundView()
                }
            }
        }
        .background {
            GeometryReader { geometry in
                Color.clear.onAppear { width = geometry.size.width }
            }
        }
        .aspectRatio(2.5/3.5, contentMode: .fit)
        .cornerRadius(cornerRadius)
        .tint(tintColor)
    }
}

extension CardView {
    func flipCard() -> CardView {
        CardView(card: self.card, flipped: true, theme: self.theme, backgroundView: self.backgroundView)
    }
}

extension CardView where BackgroundView == Color {
    init (card: Card, flipped: Bool = false, theme: Theme) {
        self.card = card
        self.flipped = flipped
        self.theme = theme
        self.backgroundView = { Color.white }
    }
}

#Preview {
    ZStack(alignment: .top) {
        Color.green.overlay(Color.black.opacity(0.5))
            .ignoresSafeArea()
        HStack(spacing: 10) {
            let deck = Card.fullDeck
            ForEach([Card(suit: .hearts, rank: .ace)], id: \.hashValue) { card in
                let tint: Color = switch card.suit {
                case .diamonds, .hearts: .red
                case .clubs, .spades, .empty: .black
                }
                CardView(card: card, theme: Theme()) {
                    Color.white
                }
                .foregroundStyle(tint)
            }
            
            CardView(card: .empty, theme: Theme()) {
                Color.white
            }
        }
        .padding(20)
    }.modelContainerPreview()
}
