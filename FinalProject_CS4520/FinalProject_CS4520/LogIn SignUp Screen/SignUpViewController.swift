//
//  SignUpViewController.swift
//  FinalProject_CS4520
//
//  Created by Lâm Trương on 6/18/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SignUpViewController: UIViewController {
    
    let signUpView = SignUpView()
    
    let childProgressView = ProgressSpinnerViewController()
    
    let database = Firestore.firestore()
    
    override func loadView() {
        view = signUpView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUpView.submitButton.addTarget(self, action: #selector(onSubmitButtonTapped), for: .touchUpInside)
    }
    
    @objc func onSubmitButtonTapped(){
        
        
        registerNewAccount()
        
        
        
    }
    
    func registerNewAccount(){
        //MARK: display the progress indicator...
        showActivityIndicator()
        
        if let name = signUpView.userNameTextField.text,
           let email = signUpView.emailTextField.text,
           let dob = signUpView.dateOfBirthTextField.text,
           let password = signUpView.passWordTextField.text {
            if !name.isEmpty && !email.isEmpty && !password.isEmpty {
                Auth.auth().createUser(withEmail: email.lowercased(), password: password, completion: {result, error in
                    if error == nil{
                        //MARK: the user creation is successful...
                        self.initializeUserDataInFireBase(username: name, email: email, dob: dob)
                        
                    }else{
                        //MARK: there is a error creating the user...
                        print(error)
                    }
                })
            }
            else {
                showErrorAlert(text: "Fields must not be empty")
                hideActivityIndicator()
            }
        }
        
        
    }
    
    func initializeUserDataInFireBase(username: String, email: String, dob :String){
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = username
        changeRequest?.commitChanges(completion: {(error) in
            if error == nil{
                self.addToUsersFireStore(id: (Auth.auth().currentUser?.uid)!, username: username, email: email, dob: dob)
                
            }else{
                //MARK: there was an error updating the profile...
                print("Error occured: \(String(describing: error))")
            }
        })
    }
    
    func addToUsersFireStore(id: String, username: String, email: String, dob: String){
        let collectionUsers = database
            .collection("users")
        
        do{
            collectionUsers.document(id).setData(["email": email.lowercased(), "username": username, "dob": dob], completion: {(error) in
                if error == nil{
                    let userHomePageViewController = UserHomePageViewController()
                    let tripExample1 = tripInfo(countryCity: "US", date: "05/22/2002", tripDes: "This is my 1st trip!")
                    let tripExample2 = tripInfo(countryCity: "Vietnam", date: "05/22/2002", tripDes: "This is my 2nd trip!")
                    let tripExample3 = tripInfo(countryCity: "Mexico", date: "05/22/2002", tripDes: "This is my 3rd trip!")
                    
                    userHomePageViewController.tripsArray.append(tripExample1)
                    userHomePageViewController.tripsArray.append(tripExample2)
                    userHomePageViewController.tripsArray.append(tripExample3)
                    
                    self.hideActivityIndicator()
                    
                    self.navigationController?.popViewController(animated: true)
                    self.navigationController?.pushViewController(userHomePageViewController, animated: true)
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

