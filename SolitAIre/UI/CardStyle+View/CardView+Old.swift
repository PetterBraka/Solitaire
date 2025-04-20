//
//  CardStyleOld.swift
//  SolitAIre
//
//  Created by Petter Braka on 20/04/2025.
//

import SwiftUI

extension CardView {
    @ViewBuilder
    var oldFace: some View {
        let symbolScale: CGFloat = 0.3
        let symbolLargeSize: CGFloat = 0.5
        Grid(alignment: .center, horizontalSpacing: 0, verticalSpacing: 0) {
            GridRow(alignment: .center) {
                suit
                    .scaleWidth(symbolScale, using: width)
                Spacer()
                rank
                    .scaleWidth(symbolScale, using: width)
            }

            suit
                .scaleWidth(symbolLargeSize, using: width)
                .frame(maxHeight: .infinity)

            GridRow(alignment: .firstTextBaseline) {
                rank
                    .scaleWidth(symbolScale, using: width)
                Spacer()
                suit
                    .scaleWidth(symbolScale, using: width)
            }
        }
        .frame(maxWidth: .infinity)
    }

    @ViewBuilder
    var oldBack: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .fill(.red)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        HStack {
            let card = CardView(card: .init(suit: .hearts, rank: .ace), flipped: false, theme: .init(cardStyle: .old)) {
                Color.white
            }
            card
            card.flipCard()
        }
    }
}
