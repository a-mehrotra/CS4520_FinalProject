//
//  SignUpViewController.swift
//  FinalProject_CS4520
//
//  Created by Lâm Trương on 6/18/23.
//

import UIKit

class SignUpViewController: UIViewController {

    let signUpView = SignUpView()
    
    override func loadView() {
        view = signUpView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUpView.submitButton.addTarget(self, action: #selector(onSubmitButtonTapped), for: .touchUpInside)
    }
    
    @objc func onSubmitButtonTapped(){
        let userHomePageViewController = UserHomePageViewController()
        let tripExample1 = tripInfo(countryCity: "US", date: "05/22/2002", tripDes: "This is my 1st trip!")
        let tripExample2 = tripInfo(countryCity: "Vietnam", date: "05/22/2002", tripDes: "This is my 2nd trip!")
        let tripExample3 = tripInfo(countryCity: "Mexico", date: "05/22/2002", tripDes: "This is my 3rd trip!")
        
        userHomePageViewController.tripsArray.append(tripExample1)
        userHomePageViewController.tripsArray.append(tripExample2)
        userHomePageViewController.tripsArray.append(tripExample3)
        
        navigationController?.pushViewController(userHomePageViewController, animated: true)

    }

}

