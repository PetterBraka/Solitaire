//
//  CardView.swift
//  SolitAIre
//
//  Created by Petter vang Brakalsvålet on 13/04/2025.
//

import SwiftUI

public struct CardView<BackgroundView: View>: View {
    let card: Card
    let flipped: Bool
    let backgroundView: () -> BackgroundView
    
    init(
        card: Card,
        flipped: Bool = false,
        backgroundView: @escaping () -> BackgroundView
    ) {
        self.card = card
        self.flipped = flipped
        self.backgroundView = backgroundView
    }
    
    var rank: Text { Text(card.rank.symbol).bold() }
    
    var suit: Image { Image(systemName: card.suit.symbol + ".fill") }
    
    @State private var width: CGFloat = 0
    private var cornerRadius: CGFloat { width * 0.05 }
    
    public var body: some View {
        Group {
            if card.suit == .empty {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: width * 0.05)
                    .foregroundStyle(Color.black.opacity(0.25))
            } else {
                Group {
                    if flipped {
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .stroke(lineWidth: width * 0.02)
                    } else {
                        face
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
    }
    
    var face: some View {
        VStack {
            HStack {
                suit
                    .scaleWidth(0.18, using: width)
                Spacer()
                rank
                    .scaleWidth(0.2, using: width)
            }
            
            suit
                .scaleWidth(0.4, using: width)
                .frame(maxHeight: .infinity)
            
            HStack {
                rank
                    .scaleWidth(0.2, using: width)
                Spacer()
                suit
                    .scaleWidth(0.18, using: width)
            }
        }
    }
    
    var back: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .fill(.red)
    }
}
extension CardView {
    func flipCard() -> CardView {
        CardView(card: self.card, flipped: true, backgroundView: self.backgroundView)
    }
}

extension CardView where BackgroundView == Color {
    init (card: Card, flipped: Bool = false) {
        self.card = card
        self.flipped = flipped
        self.backgroundView = { Color.white }
    }
}

#Preview {
    ZStack(alignment: .top) {
        Color.green.overlay(Color.black.opacity(0.5))
            .ignoresSafeArea()
        HStack(spacing: 10) {
            let deck = Card.fullDeck
            ForEach(deck.prefix(6), id: \.hashValue) { card in
                let tint: Color = switch card.suit {
                case .diamonds, .hearts: .red
                case .clubs, .spades, .empty: .black
                }
                CardView(card: card) {
                    Color.white
                }
                .foregroundStyle(tint)
            }
            
            CardView(card: .empty) {
                Color.white
            }
        }
        .padding(20)
    }
}
