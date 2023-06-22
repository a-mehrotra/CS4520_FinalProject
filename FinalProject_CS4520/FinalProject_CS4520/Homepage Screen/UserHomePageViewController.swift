//
//  UserHomePageViewController.swift
//  FinalProject_CS4520
//
//  Created by Lâm Trương on 6/20/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class UserHomePageViewController: UIViewController {
    
    var tripsArray = [tripInfo]()
    let userHomePageView = UserHomePageView()
    
    var handleAuth: AuthStateDidChangeListenerHandle?
    
    var currentUser:FirebaseAuth.User?
    
    let database = Firestore.firestore()
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tripsArray.removeAll()
        
        self.tripsArray = getTripsOfCurrentUser()
        
        self.userHomePageView.tableViewTrips.reloadData()
        
        
    }
    
    
    func getTripsOfCurrentUser() -> [tripInfo] {
        var userRef: DocumentReference!
        var listOfTrips = [tripInfo]()
        userRef = self.database.collection("users").document((currentUser?.uid)!)
         
        self.database.collection("trips").whereField("userArray", arrayContains: userRef!).addSnapshotListener(includeMetadataChanges: false, listener: {querySnapshot, error in
            
            if let documents = querySnapshot?.documents {
                self.tripsArray.removeAll()
                for document in documents {
                    do {
                        let trip = try document.data(as: tripInfo.self)
                        listOfTrips.append(trip)
                    }
                    catch {
                        print(error)
                    }
                }
            }
            
            
        
        })
        return listOfTrips
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
        var profileSettingViewController = ProfileSettingViewController()
        navigationController?.pushViewController(profileSettingViewController, animated: true)
    }
    
    @objc func addNewPostButtonTapped(){
        var addPostViewController = AddPostViewController()
        navigationController?.pushViewController(addPostViewController, animated: true)
    }
    
    
    
}
