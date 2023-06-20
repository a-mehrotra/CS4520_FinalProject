//
//  LogInViewController.swift
//  FinalProject_CS4520
//
//  Created by Lâm Trương on 6/18/23.
//

import UIKit

class LogInViewController: UIViewController {

    let logInView = LogInView()
    
    override func loadView() {
        view = logInView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        logInView.submitButton.addTarget(self, action: #selector(onSubmitButtonTapped), for: .touchUpInside)
    }
    
    @objc func onSubmitButtonTapped(){
        print("login user")

    }

}

