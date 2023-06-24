//
//  ExistingTripsTableViewManager.swift
//  FinalProject_CS4520
//
//  Created by Aleksei Shilov on 6/24/23.
//

import Foundation
import UIKit

extension ExistingTripViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return existingTripsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewExistingTrips" , for: indexPath) as! TripsTableViewCell
        cell.backgroundColor = UIColor(red: 103, green: 71, blue: 200)
        cell.labelCityCountryName.text = existingTripsArray[indexPath.row].countryCity
        cell.labelDate.text = existingTripsArray[indexPath.row].date
        cell.labelTripDescription.text = existingTripsArray[indexPath.row].tripDes
        return cell
    }
    

}
