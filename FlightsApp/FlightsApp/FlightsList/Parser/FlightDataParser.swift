//
//  FlightDataParser.swift
//  FlightsApp
//
//  Created by Shivam Seth on 6/26/19.
//  Copyright © 2019 Shivam Seth. All rights reserved.
//

import Foundation

class FlightDataParser {
    
    class func parseFlightData(_ json : [String: Any]) -> FlightData {
        let flightData = FlightData()
        updateFlightData(json, flightData: flightData)
        return flightData
    }
    
    fileprivate class func updateFlightData(_ json: [String: Any], flightData: FlightData) {
        
        if let originCode = json[FlightData.SerializationKeys.originCode] as? String {
            flightData.originCode = originCode
        }
        
        if let destinationCode = json[FlightData.SerializationKeys.destinationCode] as? String {
            flightData.destinationCode = destinationCode
        }
        
        if let takeoffTime = json[FlightData.SerializationKeys.takeoffTime] as? String {
            flightData.takeoffTime = takeoffTime
        }
        
        if let landingTime = json[FlightData.SerializationKeys.landingTime] as? String {
            flightData.landingTime = landingTime
        }
        
        if let price = json[FlightData.SerializationKeys.price] as? String {
            flightData.price = price
        }
        
        if let airlineCode = json[FlightData.SerializationKeys.airlineCode] as? String {
            flightData.airlineCode = airlineCode
        }
        
        if let flightClass = json[FlightData.SerializationKeys.flightClass] as? String {
            flightData.flightClass = flightClass
        }
        
    }
}
