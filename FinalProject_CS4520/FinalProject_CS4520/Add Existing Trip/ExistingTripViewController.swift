//
//  ExistingTripViewController.swift
//  FinalProject_CS4520
//
//  Created by Aleksei Shilov on 6/24/23.
//

import UIKit

class ExistingTripViewController: UIViewController {
    
    var existingTripsArray = [tripInfo]()
    let existingTripView = ExistingTripView()
    
    override func loadView() {
        view = existingTripView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        existingTripView.tableViewTrips.delegate = self
        existingTripView.tableViewTrips.dataSource = self
        
        //MARK: removing the separator line...
        existingTripView.tableViewTrips.separatorStyle = .none
        
    }
}
