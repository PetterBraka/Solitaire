//
//  CardView+Modern.swift
//  SolitAIre
//
//  Created by Petter Braka on 20/04/2025.
//

import SwiftUI

extension CardView {
    @ViewBuilder
    var modernFace: some View {
        VStack {
            let symbolSize: CGFloat = 0.3
            let symbolLargeSize: CGFloat = 0.8
            HStack(alignment: .center) {
                suit
                    .scaleWidth(symbolSize, using: width)
                Spacer()
                rank
                    .scaleWidth(symbolSize, using: width)
            }
            suit
                .scaleWidth(symbolLargeSize, using: width)

            Spacer()
        }
        .frame(maxWidth: .infinity)
    }

    @ViewBuilder
    var modernBack: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .fill(.red)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        HStack {
            let card = CardView(card: .init(suit: .hearts, rank: .ace), flipped: false, theme: .init(cardStyle: .modern)) {
                Color.white
            }
            card
            card.flipCard()
        }
    }
}
