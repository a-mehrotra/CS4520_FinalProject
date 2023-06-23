//
//  ViewController.swift
//  FinalProject_CS4520
//
//  Created by Aryan on 6/6/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ViewController: UIViewController {
    
    let mainScreen = MainScreenView()
    
    var handleAuth: AuthStateDidChangeListenerHandle?
    var currentUser:FirebaseAuth.User?
    
    var tripsArray = [tripInfo]()
    
    override func loadView() {
        view = mainScreen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //MARK: handling if the Authentication state is changed (sign in, sign out, register)...
        handleAuth = Auth.auth().addStateDidChangeListener{ auth, user in
            if user == nil{
                //MARK: not signed in...
                self.currentUser = nil
                self.loggedInContentShow(false)
            }else{
                //MARK: the user is signed in...
                self.currentUser = user
                let tripExample1 = tripInfo(countryCity: "US", date: "05/22/2002", tripDes: "This is my 1st trip!")
                let tripExample2 = tripInfo(countryCity: "Vietnam", date: "05/22/2002", tripDes: "This is my 2nd trip!")
                let tripExample3 = tripInfo(countryCity: "Mexico", date: "05/22/2002", tripDes: "This is my 3rd trip!")
                
                self.tripsArray.append(tripExample1)
                self.tripsArray.append(tripExample2)
                self.tripsArray.append(tripExample3)
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
        let addPostViewController = AddPostViewController()
        navigationController?.pushViewController(addPostViewController, animated: true)
    }
    
    func loggedInContentShow(_ value: Bool) {
        mainScreen.tripTitle.isHidden = !value
        self.mainScreen.tableViewTrips.isHidden = !value
        self.mainScreen.tableViewTrips.reloadData()
        
        navigationItem.rightBarButtonItem?.isHidden = !value
        navigationItem.leftBarButtonItem?.isHidden = !value
        
        mainScreen.appTitle.isHidden = value
        mainScreen.sloganTitle.isHidden = value
        mainScreen.welcomeBackTitle.isHidden = value
        mainScreen.welcomeTitle.isHidden = value
        
        mainScreen.loginButton.isHidden = value
        mainScreen.signupButton.isHidden = value
    }
}
