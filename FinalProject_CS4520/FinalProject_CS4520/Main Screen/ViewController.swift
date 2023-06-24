//
//  ViewController.swift
//  FinalProject_CS4520
//
//  Created by Aryan on 6/6/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class ViewController: UIViewController {
    
    let mainScreen = MainScreenView()
    
    var handleAuth: AuthStateDidChangeListenerHandle?
    var currentUser:FirebaseAuth.User?
    
    var tripsArray = [Trip]()
    
    let database = Firestore.firestore()
    let notificationCenter = NotificationCenter.default
    
    override func loadView() {
        view = mainScreen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("in view will appear")
        //MARK: handling if the Authentication state is changed (sign in, sign out, register)...
        handleAuth = Auth.auth().addStateDidChangeListener{ auth, user in
            if user == nil{
                //MARK: not signed in...
                self.currentUser = nil
                self.loggedInContentShow(false)
            }else{
                //MARK: the user is signed in...
                self.currentUser = user
                
                self.loggedInContentShow(true)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainScreen.signupButton.addTarget(self, action: #selector(onSignUpButtonTapped), for: .touchUpInside)
        mainScreen.loginButton.addTarget(self, action: #selector(onLogInButtonTapped), for: .touchUpInside)
        
        setupRightBarButton()
        
        mainScreen.tableViewTrips.delegate = self
        mainScreen.tableViewTrips.dataSource = self
        
        //MARK: removing the separator line...
        mainScreen.tableViewTrips.separatorStyle = .none
        
        notificationCenter.addObserver(self, selector: #selector(tripAdded), name: .tripAdded, object: nil)
    }
    @objc func tripAdded() {
        self.updateTrips()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Auth.auth().removeStateDidChangeListener(handleAuth!)
    }
    
    @objc func onSignUpButtonTapped(){
        let signUpViewController = SignUpViewController()
        navigationController?.pushViewController(signUpViewController, animated: true)
        
        //        var profileSettingViewController = ProfileSettingViewController()
        //        navigationController?.pushViewController(profileSettingViewController, animated: true)
        
        
    }
    
    @objc func onLogInButtonTapped(){
        let logInViewController = LogInViewController()
        navigationController?.pushViewController(logInViewController, animated: true)
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
            action: #selector(addNewTripButtonTapped)
        )
        
        navigationItem.rightBarButtonItems = [barIcon]
        navigationItem.leftBarButtonItem = addPostIcon
        
    }
    
    
    @objc func profileBarButtonTapped(){
        let profileSettingViewController = ProfileSettingViewController()
        navigationController?.pushViewController(profileSettingViewController, animated: true)
    }
    
    //    @objc func addNewPostButtonTapped(){
    //        let addPostViewController = AddPostViewController()
    //        navigationController?.pushViewController(addPostViewController, animated: true)
    //    }
    
    
    @objc func addNewTripButtonTapped(){
        let addTripOptionAlert = UIAlertController(
            title: "Add Trip",
            message: "Please select",
            preferredStyle: .alert)
        
        //MARK: Sign In Action...
        let addNewTripAction = UIAlertAction(title: "Add New Trip", style: .default, handler: {(_) in
            var addTripViewController = AddTripViewController()
            addTripViewController.currentUser = self.currentUser
            self.navigationController?.pushViewController(addTripViewController, animated: true)
        })
        
        let addExistingTripAction = UIAlertAction(title: "Add Existing Trip", style: .default, handler: {(_) in
            //MARK: logic to open the register screen...
            let existingTripViewController = ExistingTripViewController()
            
            self.navigationController?.pushViewController(existingTripViewController, animated: true)
        })
        
        //MARK: action buttons...
        addTripOptionAlert.addAction(addNewTripAction)
        addTripOptionAlert.addAction(addExistingTripAction)
        
        self.present(addTripOptionAlert, animated: true)
        
        
    }
    
    func loggedInContentShow(_ value: Bool) {
        mainScreen.tripTitle.isHidden = !value
        self.mainScreen.tableViewTrips.isHidden = !value
        
        if value {
            self.updateTrips()
        }
        
        
        navigationItem.rightBarButtonItem?.isHidden = !value
        navigationItem.leftBarButtonItem?.isHidden = !value
        
        mainScreen.appTitle.isHidden = value
        mainScreen.sloganTitle.isHidden = value
        mainScreen.welcomeBackTitle.isHidden = value
        mainScreen.welcomeTitle.isHidden = value
        
        mainScreen.loginButton.isHidden = value
        mainScreen.signupButton.isHidden = value
    }
    
    
    
    func updateTrips() {
        self.tripsArray.removeAll()
        
        print("hello")
        print("test")
        print((currentUser?.uid)!)
        
        self.database.collection("trips").whereField("userArray", arrayContains: (currentUser?.uid)!).getDocuments(completion: {(querySnapshot, error) in
            if let documents = querySnapshot?.documents {
                self.tripsArray.removeAll()
                for document in documents {
                    do {
                        let trip = try document.data(as: Trip.self)
                        self.tripsArray.append(trip)
                    }
                    catch {
                        print(error)
                    }
                }
                self.mainScreen.tableViewTrips.reloadData()
            }
            
            
            
        })
        
        
    }
    
  
    
    
    
    func showErrorAlert(_ text: String){
        let alert = UIAlertController(title: "Error!", message: text, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }
    
    
    
}
