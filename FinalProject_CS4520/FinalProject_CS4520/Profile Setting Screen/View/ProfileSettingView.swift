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
        setUpSubmitButton()
        
        initConstraints()
    }
    
    func setUpLogoImage(){
        
    }
    
    func setupTextFieldUserName(){ 
        userNameTextField = UITextField()
        userNameTextField.placeholder = "Username"
        userNameTextField.leftViewMode = .always
        userNameTextField.leftView = UIView(frame: CGRect(x:0,y:0,width:5,height:0))
        userNameTextField.layer.cornerRadius = 15.0
//        userNameTextField.layer.borderWidth = 2.0
        userNameTextField.backgroundColor = .white
        userNameTextField.layer.borderColor = UIColor.white.cgColor
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(userNameTextField)
    }
    
    func setupTextFieldEmail(){
        emailTextField = UITextField()
        emailTextField.placeholder = "Email"
        emailTextField.leftViewMode = .always
        emailTextField.leftView = UIView(frame: CGRect(x:0,y:0,width:5,height:0))
        emailTextField.layer.cornerRadius = 15.0
//        userNameTextField.layer.borderWidth = 2.0
        emailTextField.backgroundColor = .white
        emailTextField.layer.borderColor = UIColor.white.cgColor
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(emailTextField)
    }
    
    func setupTextFieldDateOfBirth(){
        dateOfBirthTextField = UITextField()
        dateOfBirthTextField.placeholder = "MM/DD/YY"
        dateOfBirthTextField.leftViewMode = .always
        dateOfBirthTextField.leftView = UIView(frame: CGRect(x:0,y:0,width:5,height:0))
        dateOfBirthTextField.layer.cornerRadius = 15.0
//        userNameTextField.layer.borderWidth = 2.0
        dateOfBirthTextField.backgroundColor = .white
        dateOfBirthTextField.layer.borderColor = UIColor.white.cgColor
        dateOfBirthTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(dateOfBirthTextField)
    }
    
    func setupTextFieldBio(){
        bioTextField = UITextField()
        bioTextField.placeholder = "Bio"
        bioTextField.leftViewMode = .always
        bioTextField.leftView = UIView(frame: CGRect(x:0,y:0,width:5,height:0))
        bioTextField.layer.cornerRadius = 15.0
//        userNameTextField.layer.borderWidth = 2.0
        bioTextField.backgroundColor = .white
        bioTextField.layer.borderColor = UIColor.white.cgColor
        bioTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(bioTextField)
    }

    func setUpSubmitButton(){
        signOutButton = UIButton(type: .system)
        signOutButton.setTitle("SignOut", for: .normal)
        signOutButton.layer.cornerRadius = 15.0
        signOutButton.backgroundColor = UIColor(red: 54, green: 10, blue: 138)
        signOutButton.setTitleColor(.white, for: .normal)
        signOutButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        signOutButton.contentEdgeInsets =  UIEdgeInsets(top: 8, left: 30, bottom: 8, right: 30)
        signOutButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(signOutButton)
    }

    func initConstraints(){
        NSLayoutConstraint.activate([
            userNameTextField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor , constant: 22),
            userNameTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            userNameTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            userNameTextField.heightAnchor.constraint(equalToConstant: 46),
            
            emailTextField.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor , constant: 44),
            emailTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            emailTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            emailTextField.heightAnchor.constraint(equalToConstant: 46),
            
            dateOfBirthTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor , constant: 44),
            dateOfBirthTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            dateOfBirthTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            dateOfBirthTextField.heightAnchor.constraint(equalToConstant: 46),
            
            bioTextField.topAnchor.constraint(equalTo: dateOfBirthTextField.bottomAnchor , constant: 44),
            bioTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            bioTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            bioTextField.heightAnchor.constraint(equalToConstant: 120),
            bioTextField.heightAnchor.constraint(equalToConstant: 46),
          
            signOutButton.topAnchor.constraint(equalTo: bioTextField.bottomAnchor , constant: 50),
            signOutButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
