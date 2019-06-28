//
//  FlightDataTableViewCell.swift
//  FlightsApp
//
//  Created by Shivam Seth on 6/27/19.
//  Copyright © 2019 Shivam Seth. All rights reserved.
//

import UIKit

class FlightDataTableViewCell: UITableViewCell {

    static func registerCellForTableView(tableView: UITableView) {
        let nib = UINib.init(nibName: "FlightDataTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: kIdentifier)
    }
    
    //MARK: Constants
    static let kIdentifier: String = "FlightDataTableViewCell"
    
    //MARK: IBOutlets
    @IBOutlet var lOriginCityNameLabel: UILabel!
    @IBOutlet var lDestinationCityNameLabel: UILabel!
    @IBOutlet var lTakeOffTimeLabel: UILabel!
    @IBOutlet var lLandingTimeLabel: UILabel!
    @IBOutlet var lPriceLabel: UILabel!
    @IBOutlet var lClassLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(itemViewModel: FlightDataItemViewModel) {
        lOriginCityNameLabel.text = itemViewModel.originCityName
        lDestinationCityNameLabel.text = itemViewModel.destinationCityName
        lPriceLabel.text = itemViewModel.flightClassAndPrice
        lClassLabel.text = itemViewModel.airLineName
        lTakeOffTimeLabel.text = itemViewModel.takeOffTimeString
        lLandingTimeLabel.text = itemViewModel.landingTimeString
    }
    
}
