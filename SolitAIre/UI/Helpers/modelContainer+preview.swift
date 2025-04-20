//
//  modelContainer+preview.swift
//  SolitAIre
//
//  Created by Petter Braka on 20/04/2025.
//

import SwiftUI
import SwiftData

extension View {
    func modelContainerPreview() -> some View {
        modelContainer(for: [HighScore.self, SaveData.self, Theme.self], inMemory: true)
    }
}
