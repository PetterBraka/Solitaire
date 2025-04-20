//
//  View+scaled.swift
//  SolitAIre
//
//  Created by Petter Braka on 20/04/2025.
//

import SwiftUI

extension Image {
    func scaleWidth(_ value: CGFloat, using width: CGFloat) -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: width * value)
    }
}

extension Text {
    func scaleWidth(_ value: CGFloat, using width: CGFloat) -> some View {
        self
            .font(.system(size: width * value))
    }
}
