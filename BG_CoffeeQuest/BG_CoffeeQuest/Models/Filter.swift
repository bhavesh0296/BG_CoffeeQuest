//
//  Filter.swift
//  BG_CoffeeQuest
//
//  Created by bhavesh on 25/08/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import Foundation

public struct Filter {
    public let filter: (Business) -> Bool
    public var businesses: [Business]

    public static func identify() -> Filter {
        return Filter(filter: {_ in return true}, businesses: [])
    }

    public static func starRating(atLeast starRating: Double) -> Filter {
        return Filter(filter: { $0.rating >= starRating }, businesses: [])
    }

    public func filterBusiness() -> [Business] {
        return businesses.filter(filter)
    }
}

extension Filter: Sequence {

    // into this have to used filterBusiness
    public func makeIterator() -> IndexingIterator<[Business]> {
        return filterBusiness().makeIterator()
    }
}
