//
//  CardView.swift
//  SolitAIre
//
//  Created by Petter vang Brakalsvålet on 13/04/2025.
//

import SwiftUI

public struct CardView<BackgroundView: View>: View {
    let card: Card
    
    let backgroundView: () -> BackgroundView
    
    var rank: Text { Text(card.rank.symbol).bold() }
    
    var suit: Image { Image(systemName: card.suit.symbol + ".fill") }
    
    @State private var width: CGFloat = 0
    
    public var body: some View {
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
        .frame(maxHeight: .infinity)
        .padding(width * 0.05)
        .background {
            GeometryReader { geometry in
                backgroundView().onAppear { width = geometry.size.width }
            }
        }
        .aspectRatio(2.5/3.5, contentMode: .fit)
        .cornerRadius(width * 0.05)
    }
}

private extension Image {
    func scaleWidth(_ value: CGFloat, using width: CGFloat) -> some View {
        self
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(maxWidth: width * value)
    }
}

private extension Text {
    func scaleWidth(_ value: CGFloat, using width: CGFloat) -> some View {
        font(.system(size: width * value))
    }
}

#Preview {
    ZStack(alignment: .top) {
        Color.green.overlay(Color.black.opacity(0.5))
            .ignoresSafeArea()
        HStack(spacing: 10) {
            let deck = Card.fullDeck
            ForEach(deck.prefix(7), id: \.hashValue) { card in
                let tint: Color = switch card.suit {
                case .diamonds, .hearts: .red
                case .clubs, .spades: .black
                }
                CardView(card: card) {
                    Color.white
                }
                .foregroundStyle(tint)
            }
        }
        .padding(20)
    }
}
