//
//  CodableColor.swift
//  SolitAIre
//
//  Created by Petter Braka on 20/04/2025.
//

import SwiftUI

public struct CodableColor: Codable {
    let red: Double
    let green: Double
    let blue: Double
    let opacity: Double

    init(red: Double, green: Double, blue: Double, opacity: Double) {
        self.red = red
        self.green = green
        self.blue = blue
        self.opacity = opacity
    }

    init(from color: Color) {
        let resolved = color.resolve(in: .init())

        red = Double(resolved.red)
        green = Double(resolved.green)
        blue = Double(resolved.blue)
        opacity = Double(resolved.opacity)
    }

    func toColor() -> Color {
        Color(red: red, green: green, blue: blue, opacity: opacity)
    }
}
