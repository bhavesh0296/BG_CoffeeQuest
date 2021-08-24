//
//  AnnotationFactory.swift
//  BG_CoffeeQuest
//
//  Created by bhavesh on 24/08/21.
//  Copyright © 2021 Bhavesh. All rights reserved.
//

import UIKit
import YelpAPI
import MapKit

public class AnnotationFactory {

    public func createBusinessMapViewModel(for business: YLPBusiness) -> BusinessMapViewModel? {
        guard let yelpCoordinate = business.location.coordinate else {
            return nil
        }

        let coordinate = CLLocationCoordinate2D(latitude: yelpCoordinate.latitude,
                                                longitude:yelpCoordinate.longitude)

        let image: UIImage

        switch business.rating {
        case 0..<3.5:
            image = UIImage(named: "bad")!
        case 3.5..<4.0:
            image = UIImage(named: "meh")!
        case 4..<4.75:
            image = UIImage(named: "good")!
        case 4...5:
            image = UIImage(named: "great")!
        default:
            image = UIImage(named: "bad")!
        }

        return BusinessMapViewModel(coordinate: coordinate, name: business.name, rating: business.rating, image: image)
    }

    public func createBusinessMapViewModel(for business: Business) -> BusinessMapViewModel {

           let image: UIImage
           switch business.rating {
           case 0..<3.5:
               image = UIImage(named: "bad")!
           case 3.5..<4.0:
               image = UIImage(named: "meh")!
           case 4..<4.75:
               image = UIImage(named: "good")!
           case 4...5:
               image = UIImage(named: "great")!
           default:
               image = UIImage(named: "bad")!
           }

        return BusinessMapViewModel(coordinate: business.location, name: business.name, rating: business.rating, image: image)
       }

}
