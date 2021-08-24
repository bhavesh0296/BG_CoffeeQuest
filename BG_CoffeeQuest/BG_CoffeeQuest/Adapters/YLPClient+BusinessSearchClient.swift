//
//  YLPClient+BusinessSearchClient.swift
//  BG_CoffeeQuest
//
//  Created by bhavesh on 24/08/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import MapKit
import YelpAPI

extension YLPClient: BusinessSearchClient {

    public func search(with coordinate: CLLocationCoordinate2D, term: String, limit: UInt, offset: UInt, completion: @escaping (Result<[Business], Error>) -> Void) {
        let yelpCoordinate = YLPCoordinate(latitude: coordinate.latitude, longitude: coordinate.longitude)
        search(with: yelpCoordinate,
               term: term,
               limit: limit,
               offset: offset,
               sort: .bestMatched) { (searchResult, error) in
                guard let searchResult = searchResult,
                    error == nil else {
                        completion(.failure(error!))
                        return
                }
                let businesses = searchResult.businesses.adaptToBusiness()
                completion(.success(businesses))
        }
    }
}

extension Array where Element: YLPBusiness {

    func adaptToBusiness() -> [Business] {
        return self.compactMap { (yelpBusiness) in
            guard let yelpCoordinate = yelpBusiness.location.coordinate else { return nil }
            let coordinate = CLLocationCoordinate2D(latitude: yelpCoordinate.latitude,
                                                    longitude: yelpCoordinate.longitude)
            return Business(name: yelpBusiness.name, rating: yelpBusiness.rating, location: coordinate)
        }
    }
}
