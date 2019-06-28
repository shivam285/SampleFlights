//
//  FlightsListDelegates.swift
//  FlightsApp
//
//  Created by Shivam Seth on 6/26/19.
//  Copyright © 2019 Shivam Seth. All rights reserved.
//

import Foundation

protocol FlightsListViewModelDelegate: class {
    
    func flightsListViewModel(_ viewModel: FlightsListViewModel, fetchedFlightDataSuccessfully itemViewModels: [FlightDataItemViewModel])
    
    func flightsListViewModel(_ viewModel: FlightsListViewModel, failedToFetchFlightData error: Error)

}
