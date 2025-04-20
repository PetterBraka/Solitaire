//
//  Theme+FetchDescripition.swift
//  SolitAIre
//
//  Created by Petter Braka on 20/04/2025.
//

import SwiftData

extension FetchDescriptor where T == Theme {
    static let `default`: FetchDescriptor<Theme> = {
        var description = FetchDescriptor<Theme>()
        description.fetchLimit = 1
        return description
    }()
}
