//
//  LogInViewController.swift
//  FinalProject_CS4520
//
//  Created by Lâm Trương on 6/18/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class LogInViewController: UIViewController {

    let logInView = LogInView()
    
    var handleAuth: AuthStateDidChangeListenerHandle?
    
    let childProgressView = ProgressSpinnerViewController()
    
    override func loadView() {
        view = logInView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        logInView.submitButton.addTarget(self, action: #selector(onSubmitButtonTapped), for: .touchUpInside)
    }
    
    @objc func onSubmitButtonTapped(){
        let userHomePageViewController = UserHomePageViewController()
        let tripExample1 = tripInfo(countryCity: "US", date: "05/22/2002", tripDes: "This is my 1st trip!")
        let tripExample2 = tripInfo(countryCity: "Vietnam", date: "05/22/2002", tripDes: "This is my 2nd trip!")
        let tripExample3 = tripInfo(countryCity: "Mexico", date: "05/22/2002", tripDes: "This is my 3rd trip!")
        
        userHomePageViewController.tripsArray.append(tripExample1)
        userHomePageViewController.tripsArray.append(tripExample2)
        userHomePageViewController.tripsArray.append(tripExample3)
        
        
        loginToAccount()
        
        
        navigationController?.pushViewController(userHomePageViewController, animated: true)

    }

    
    func loginToAccount() {
        showActivityIndicator()
        if let email = logInView.userNameTextField.text, let password = logInView.passWordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password)
            print("Logged In UID: \((Auth.auth().currentUser?.uid)!)")
            hideActivityIndicator()
            navigationController?.popViewController(animated: true)
        }
    }
}

