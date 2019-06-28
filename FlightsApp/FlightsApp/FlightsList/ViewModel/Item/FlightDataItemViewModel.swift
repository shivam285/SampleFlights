//
//  FlightDataItemViewModel.swift
//  FlightsApp
//
//  Created by Shivam Seth on 6/26/19.
//  Copyright © 2019 Shivam Seth. All rights reserved.
//

import Foundation

class FlightDataItemViewModel: NSObject {
    
    //MARK: - Properties
    var flightData: FlightData!
    
    //MARK: - Intialization methods
    init(flightData: FlightData) {
        self.flightData = flightData
    }
    
    //MARK: - Computed Properties
    var airLineName : String {
        if let name = flightData.airLineName {
            return name
        }
        return ""
    }
    
    var originCityName : String {
        if let name = flightData.originCityName {
            return name
        }
        return ""
    }
    
    var destinationCityName: String {
        if let name = flightData.destinationCityName {
            return name
        }
        return ""
    }
    
    var takeOffDate: Date? {
        if let time = flightData.takeoffTime {
            let interval = TimeInterval(Double(time)!)
            let date = Date(timeIntervalSince1970: interval)
            return date
        }
        return nil
    }
    
    var landingTimeDate:Date? {
        if let time = flightData.landingTime {
            let interval = TimeInterval(Double(time)!)
            let date = Date(timeIntervalSince1970: interval)
            return date
        }
        return nil
    }
    
    var takeOffTimeString: String {
        if let takeOffDate = takeOffDate {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:MM"
            return dateFormatter.string(from: takeOffDate)
        }
        return "NA"
    }
    
    var landingTimeString:String {
        if let takeOffDate = landingTimeDate {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:MM"
            return dateFormatter.string(from: takeOffDate)
        }
        return "NA"
    }
    
    var flightClassAndPrice: String {
        var items = [String]()
        if let flightClass = flightData.flightClass {
            items.append(flightClass)
        }
        
        if let price = flightData.price {
            items.append(price)
        }
        
        return items.joined(separator: " - ")
    }
}
