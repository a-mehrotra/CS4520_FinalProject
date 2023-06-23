//
//  Trip.swift
//  FinalProject_CS4520
//
//  Created by Lâm Trương on 6/20/23.
//

import Foundation

struct tripInfo: Codable{
    var countryCity: String
    var date: String
    var tripDes: String
    
    init(countryCity: String, date: String, tripDes: String) {
        self.countryCity = countryCity
        self.date = date
        self.tripDes = tripDes
    }
}
