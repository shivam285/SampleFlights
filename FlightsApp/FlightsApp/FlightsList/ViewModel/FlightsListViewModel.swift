//
//  FlightsListViewModel.swift
//  FlightsApp
//
//  Created by Shivam Seth on 6/26/19.
//  Copyright © 2019 Shivam Seth. All rights reserved.
//

import Foundation
import UIKit

struct FlightsListViewModelInitParams {
    
}

class FlightsListViewModel: NSObject {
    
    //MARK: - Properties
    weak var viewDelegate:FlightsListViewModelDelegate?
    
    var flightDataItemViewModels: [FlightDataItemViewModel]?
    
    //MARK: - Computed Properties
    var urlString : String {
        return "https://www.ixigo.com/sampleFlightData"
    }
    
    var kCellIdentifier: String {
        return "FlightDataCellIdentifier"
    }
    
    //MARK: - Initialization methods
    init(params:FlightsListViewModelInitParams) {
        
    }
    
}

//MARK: - Methods
extension FlightsListViewModel{
    func getFlightDataItemViewModel(atIndexPath indexPath: IndexPath) -> FlightDataItemViewModel {
        return flightDataItemViewModels![indexPath.row]
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension FlightsListViewModel {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flightDataItemViewModels?.count ?? 0
    }
    
}

//MARK: - API and service call methods
extension FlightsListViewModel {
    
    func fetchFlightDetails() {
        
        guard let url = URL(string: urlString) else { return }
        
        NetorkManager.fetchFlightDetails(url: url, responseCallBack: {[weak self] (responseData) in
            
            if let _StrongSelf = self {
                
                do {
                    if let jsonData = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: Any] {
                        
                        if let flightsDataArray = jsonData["flightsData"] as? [[String : Any]] {
                            
                            if _StrongSelf.flightDataItemViewModels == nil {
                                _StrongSelf.flightDataItemViewModels = [FlightDataItemViewModel]()
                            }
                            
                            let airLineMapJSON = jsonData["airlineMap"] as? [String : Any]
                            let airPortMapJSON = jsonData["airportMap"] as? [String : Any]
                            
                            for eachFlightJSONData in flightsDataArray {
                                
                                let flightData = FlightDataParser.parseFlightData(eachFlightJSONData)
                                
                                if let airPortMapJSON = airPortMapJSON , let originCode = flightData.originCode, let originCityName = airPortMapJSON[originCode] as? String {
                                    flightData.originCityName = originCityName
                                }
                                
                                if let airportMapJSON = airPortMapJSON, let destinationCode = flightData.destinationCode, let destinationCityName = airportMapJSON[destinationCode] as? String  {
                                    flightData.destinationCityName = destinationCityName
                                }
                                
                                if let airLineMapJSON = airLineMapJSON, let airLineCode = flightData.airlineCode, let airLineName = airLineMapJSON[airLineCode] as? String {
                                    flightData.airLineName = airLineName
                                }
                                
                                let itemViewModel = FlightDataItemViewModel(flightData: flightData)
                                _StrongSelf.flightDataItemViewModels?.append(itemViewModel)
                                
                            }
                            
                            _StrongSelf.viewDelegate?.flightsListViewModel(_StrongSelf, fetchedFlightDataSuccessfully: _StrongSelf.flightDataItemViewModels!)
                            
                        }
                    }
                    
                }catch {
                    _StrongSelf.viewDelegate?.flightsListViewModel(_StrongSelf, failedToFetchFlightData: error)
                }
            }
        }) { [weak self](error) in
            if let _StrongSelf = self {
                _StrongSelf.viewDelegate?.flightsListViewModel(_StrongSelf, failedToFetchFlightData: error)
            }
        }
    }
    
}
