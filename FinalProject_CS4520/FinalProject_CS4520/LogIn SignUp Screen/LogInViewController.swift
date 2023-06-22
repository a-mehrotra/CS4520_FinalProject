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
        loginToAccount()
    }

    
    func loginToAccount() {
        showActivityIndicator()
        if let email = logInView.userNameTextField.text, let password = logInView.passWordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password, completion: {result, error in
                if error == nil {
                    let userHomePageViewController = UserHomePageViewController()
                    
                    
                    print("Logged In UID: \((Auth.auth().currentUser?.uid)!)")
                    self.hideActivityIndicator()
                    self.navigationController?.popViewController(animated: true)
                    self.navigationController?.pushViewController(userHomePageViewController, animated: true)
                }
                else {
                    self.hideActivityIndicator()
                    self.showErrorAlert(text: "Could not log in. Please check your details")
                }
                
            })
            
        }
    }
    
    func showErrorAlert(text:String) {
        let alert = UIAlertController(title: "Error!", message: "\(text)", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }
}

