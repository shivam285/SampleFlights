//
//  FlightData.swift
//  FlightsApp
//
//  Created by Shivam Seth on 6/26/19.
//  Copyright © 2019 Shivam Seth. All rights reserved.
//

import Foundation

class FlightData: NSObject {
    
    struct SerializationKeys {
        static let originCode = "originCode"
        static let destinationCode = "destinationCode"
        static let takeoffTime = "takeoffTime"
        static let landingTime = "landingTime"
        static let price = "price"
        static let airlineCode = "airlineCode"
        static let flightClass = "class"
    }
    
    var originCode: String?
    var destinationCode: String?
    var takeoffTime: String?
    var landingTime: String?
    var price: String?
    var airlineCode: String?
    var flightClass:String?
    
    var originCityName: String?
    var airLineName: String?
    var destinationCityName: String?

    
}
