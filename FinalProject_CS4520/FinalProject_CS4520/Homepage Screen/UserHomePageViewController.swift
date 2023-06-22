//
//  UserHomePageViewController.swift
//  FinalProject_CS4520
//
//  Created by Lâm Trương on 6/20/23.
//

import UIKit

class UserHomePageViewController: UIViewController {
    
    var tripsArray = [tripInfo]()
    let userHomePageView = UserHomePageView()
    
    override func loadView() {
        view = userHomePageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRightBarButton()
        
        userHomePageView.tableViewTrips.delegate = self
        userHomePageView.tableViewTrips.dataSource = self
        
        //MARK: removing the separator line...
        userHomePageView.tableViewTrips.separatorStyle = .none
        
    }
    
    func setupRightBarButton(){
        //MARK: user is logged in...
        let barIcon = UIBarButtonItem(
            image: UIImage(systemName: "person.fill"),
            style: .plain,
            target: self,
            action: #selector(profileBarButtonTapped)
        )
        
        let addPostIcon = UIBarButtonItem(
            image: UIImage(systemName: "plus.app.fill"),
            style: .plain,
            target: self,
            action: #selector(addNewPostButtonTapped)
        )
        
        navigationItem.rightBarButtonItems = [barIcon]
        navigationItem.leftBarButtonItem = addPostIcon
        
    }
    
    
    @objc func profileBarButtonTapped(){
        let profileSettingViewController = ProfileSettingViewController()
        navigationController?.pushViewController(profileSettingViewController, animated: true)
    }
    
    @objc func addNewPostButtonTapped(){
        let addTripOptionAlert = UIAlertController(
            title: "Add Trip",
            message: "Please select",
            preferredStyle: .alert)
        
        //MARK: Sign In Action...
        let addNewTripAction = UIAlertAction(title: "Add New Trip", style: .default, handler: {(_) in
            var addTripViewController = AddTripViewController()
            self.navigationController?.pushViewController(addTripViewController, animated: true)
            })
        
        let addExistingTripAction = UIAlertAction(title: "Add Existing Trip", style: .default, handler: {(_) in
            //MARK: logic to open the register screen...
            let existingTripViewController = ExistingTripViewController()
            
            //Example Data for UI testing
            let tripExample1 = tripInfo(countryCity: "US", date: "05/22/2002", tripDes: "This is my 1st trip!")
            let tripExample2 = tripInfo(countryCity: "Vietnam", date: "05/22/2002", tripDes: "This is my 2nd trip!")
            let tripExample3 = tripInfo(countryCity: "Mexico", date: "05/22/2002", tripDes: "This is my 3rd trip!")
            
            existingTripViewController.existingTripsArray.append(tripExample1)
            existingTripViewController.existingTripsArray.append(tripExample2)
            existingTripViewController.existingTripsArray.append(tripExample3)
            
            self.navigationController?.pushViewController(existingTripViewController, animated: true)
        })
        
        //MARK: action buttons...
        addTripOptionAlert.addAction(addNewTripAction)
        addTripOptionAlert.addAction(addExistingTripAction)
        
        self.present(addTripOptionAlert, animated: true)
     
      
    }
    
    
    
}
