//
//  BusinessSearchClient.swift
//  BG_CoffeeQuest
//
//  Created by bhavesh on 24/08/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import MapKit

public protocol BusinessSearchClient {
    func search(with coordinate: CLLocationCoordinate2D,
                term: String,
                limit: UInt,
                offset: UInt,
                completion: @escaping (Result<[Business], Error>) -> Void)
}
