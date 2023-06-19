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
        print("submit user data")

    }

}

