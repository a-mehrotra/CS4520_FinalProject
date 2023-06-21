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
    
    override func loadView() {
        view = mainScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainScreen.signupButton.addTarget(self, action: #selector(onSignUpButtonTapped), for: .touchUpInside)
        mainScreen.loginButton.addTarget(self, action: #selector(onLogInButtonTapped), for: .touchUpInside)
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


}
