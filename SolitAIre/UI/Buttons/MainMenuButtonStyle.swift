//
//  MainMenuButtonStyle.swift
//  SolitAIre
//
//  Created by Petter vang Brakalsvålet on 13/04/2025.
//

import SwiftUI

public struct MainMenuButtonStyle: ButtonStyle {
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding(.vertical, 12)
            .frame(maxWidth: .infinity)
            .background {
                Color.orange
                    .overlay(Color.black.opacity(configuration.isPressed ? 0.1 : 0))
            }
            .cornerRadius(4)
            .shadow(radius: configuration.isPressed ? 0 : 4)
            .scaleEffect(configuration.isPressed ? 0.99 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}

#Preview {
    Button("Testing") {}
        .buttonStyle(MainMenuButtonStyle())
}
