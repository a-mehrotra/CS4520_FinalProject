//
//  ProfileSettingView.swift
//  FinalProject_CS4520
//
//  Created by Lâm Trương on 6/18/23.
//

import UIKit

class ProfileSettingView: UIView {
    var imageProfileButton: UIImageView!
    
    var userNameTextField: UITextField!
    var emailTextField: UITextField!
    var dateOfBirthTextField: UITextField!
    var bioTextField: UITextField!

    var signOutButton: UIButton!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let color2 = UIColor(red: 103, green: 71, blue: 200)
        self.backgroundColor = color2
        setupTextFieldUserName()
        setupTextFieldEmail()
        setupTextFieldDateOfBirth()
        setupTextFieldBio()
        
        initConstraints()
    }
    
    func setUpLogoImage(){
        
    }
    
    func setupTextFieldUserName(){
        userNameTextField = UITextField()
        userNameTextField.placeholder = "Username"
        userNameTextField.borderStyle = .roundedRect
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(userNameTextField)
    }
    
    func setupTextFieldEmail(){
        emailTextField = UITextField()
        emailTextField.placeholder = "Email"
        emailTextField.borderStyle = .roundedRect
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(emailTextField)
    }
    
    func setupTextFieldDateOfBirth(){
        dateOfBirthTextField = UITextField()
        dateOfBirthTextField.placeholder = "MM/DD/YY"
        dateOfBirthTextField.borderStyle = .roundedRect
        dateOfBirthTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(dateOfBirthTextField)
    }
    
    func setupTextFieldBio(){
        bioTextField = UITextField()
        bioTextField.placeholder = "Bio"
        bioTextField.borderStyle = .roundedRect
        bioTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(bioTextField)
    }
//
//    func setUpSubmitButton(){
//        submitButton = UIButton(type: .system)
//        submitButton.setTitle("Submit", for: .normal)
//        submitButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
//        submitButton.translatesAutoresizingMaskIntoConstraints = false
//        self.addSubview(submitButton)
//    }
//
    func initConstraints(){
        NSLayoutConstraint.activate([
            userNameTextField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor , constant: 22),
            userNameTextField.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor , constant: 44),
            emailTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            emailTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            
            dateOfBirthTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor , constant: 44),
            dateOfBirthTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            dateOfBirthTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            
            bioTextField.topAnchor.constraint(equalTo: dateOfBirthTextField.bottomAnchor , constant: 44),
            bioTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            bioTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            bioTextField.heightAnchor.constraint(equalToConstant: 120),
        
            
//            submitButton.topAnchor.constraint(equalTo: passWordTextField.bottomAnchor , constant: 50),
//            submitButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
