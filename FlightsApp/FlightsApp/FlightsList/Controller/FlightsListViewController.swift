//
//  FlightsListViewController.swift
//  FlightsApp
//
//  Created by Shivam Seth on 6/26/19.
//  Copyright © 2019 Shivam Seth. All rights reserved.
//

import UIKit

class FlightsListViewController: UIViewController {

    //MARK: - Class Initialization methods
    class func newInstance() -> FlightsListViewController {
        let controller = FlightsListViewController.init(nibName: "FlightsListViewController", bundle: nil)
        return controller
    }
    
    //MARK: - IBOutlets
    @IBOutlet var tvTableView: UITableView!
    @IBOutlet var aiActivityIndicator: UIActivityIndicatorView!
    
    //MARK: - Properties
    var viewModel:FlightsListViewModel!{
        didSet{
            viewModel.viewDelegate = self
        }
    }
    
    //MARK: - App cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavBar()
        configureView()
        aiActivityIndicator.startAnimating()
        viewModel.fetchFlightDetails()
    }

    //MARK: - Private methods
    private func setupNavBar() {
        
    }
    
    private func configureView() {
        configureTableView()
    }
    
    private func configureTableView() {
        tvTableView.delegate = self
        tvTableView.dataSource = self
        FlightDataTableViewCell.registerCellForTableView(tableView: tvTableView)
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension FlightsListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections(in: tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tableView(tableView, numberOfRowsInSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: FlightDataTableViewCell.kIdentifier, for: indexPath) as! FlightDataTableViewCell
        
        let itemViewModel = viewModel.getFlightDataItemViewModel(atIndexPath: indexPath)
        cell.configureCell(itemViewModel: itemViewModel)
        
        return cell
    }
}

//MARK: - FlightsListViewModelDelegate
extension FlightsListViewController : FlightsListViewModelDelegate {
    
    func flightsListViewModel(_ viewModel: FlightsListViewModel, fetchedFlightDataSuccessfully itemViewModels: [FlightDataItemViewModel]) {
        DispatchQueue.main.async {
            self.aiActivityIndicator.stopAnimating()
            self.tvTableView.reloadData()
        }
    }
    
    func flightsListViewModel(_ viewModel: FlightsListViewModel, failedToFetchFlightData error: Error) {
        DispatchQueue.main.async {
            self.aiActivityIndicator.stopAnimating()
        }
        print(error.localizedDescription)
    }
    
}
