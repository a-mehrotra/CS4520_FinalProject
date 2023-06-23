//
//  ProfileSettingViewController.swift
//  FinalProject_CS4520
//
//  Created by Lâm Trương on 6/18/23.
//

import UIKit
import FirebaseAuth

class ProfileSettingViewController: UIViewController {
    
    let settingView = ProfileSettingView()
    let mainPage = ViewController()
    
    override func loadView() {
        view = settingView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingView.signOutButton.addTarget(self, action: #selector(onLogOutButtonTapped), for: .touchUpInside)
    }
    
    @objc func onLogOutButtonTapped(){
        let logoutAlert = UIAlertController(title: "Logging out!", message: "Are you sure want to log out?", preferredStyle: .actionSheet)
        logoutAlert.addAction(UIAlertAction(title: "Yes, log out!", style: .default, handler: { [self](_) in
            do{
                try Auth.auth().signOut()
                self.navigationController?.popViewController(animated: true)
            }catch{
                print("Error occured!")
            }
        })
        )
        logoutAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        self.present(logoutAlert, animated: true)
    }
}

