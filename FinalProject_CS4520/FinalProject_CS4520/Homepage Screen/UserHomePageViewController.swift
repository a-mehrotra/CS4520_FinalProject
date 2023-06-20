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
            action: #selector(onLogOutBarButtonTapped)
        )  
        navigationItem.rightBarButtonItems = [barIcon]
        
    }
    
    
    @objc func onLogOutBarButtonTapped(){
    }
    
    
    
}
