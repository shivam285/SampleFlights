//
//  NetorkManager.swift
//  FlightsApp
//
//  Created by Shivam Seth on 6/29/19.
//  Copyright © 2019 Shivam Seth. All rights reserved.
//

import Foundation

class NetorkManager {
    
    static let session = URLSession.shared
    
    static func fetchFlightDetails(url: URL, responseCallBack: @escaping (Data) -> (), errorCallBack: @escaping (Error) -> ()) {
        
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                errorCallBack(error!)
                return
            }
            
            if data != nil {
                responseCallBack(data!)
                return
            }
            
        }
        dataTask.resume()
    }
}
