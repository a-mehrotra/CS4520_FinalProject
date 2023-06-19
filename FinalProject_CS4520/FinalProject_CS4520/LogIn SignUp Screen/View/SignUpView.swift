//
//  SignUpView.swift
//  FinalProject_CS4520
//
//  Created by Lâm Trương on 6/18/23.
//

import UIKit

class SignUpView: UIView {
    
    var appTitle: UILabel!
    var sloganTitle: UILabel!
    var welcomeTitle: UILabel!
    
    var userNameTextField: UITextField!
    var emailTextField: UITextField!
    var dateOfBirthTextField: UITextField!
    var passWordTextField: UITextField!
    

    var submitButton: UIButton!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let color2 = UIColor(red: 103, green: 71, blue: 200)
        self.backgroundColor = color2
        setUpAppTitle()
        setUpSloganTitle()
        setUpWelcomeTitle()
        
        setupTextFieldUserName()
        setupTextFieldEmail()
        setupTextFieldDateOfBirth()
        setupTextFieldPassword()
    
        
        setUpSubmitButton()
        
        initConstraints()
    }
    
    func setUpLogoImage(){
        
    }
    
    
    func setUpAppTitle(){
        appTitle = UILabel()
        appTitle.text = "TripTies"
        appTitle.textColor = .white
        appTitle.font = UIFont.boldSystemFont(ofSize: 44)
        appTitle.textAlignment = .center
        appTitle.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(appTitle)
    }
    
    func setUpSloganTitle(){
        sloganTitle = UILabel()
        sloganTitle.textColor = .white
        sloganTitle.text = "Here for all of yours Social Travel Need!"
        sloganTitle.font = UIFont.systemFont(ofSize: 18)
        sloganTitle.textAlignment = .center
        sloganTitle.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(sloganTitle)
    }
    
    func setUpWelcomeTitle(){
        welcomeTitle = UILabel()
        welcomeTitle.textColor = .white
        welcomeTitle.text = "Welcome!"
        welcomeTitle.font = UIFont.systemFont(ofSize: 18)
        welcomeTitle.textAlignment = .center
        welcomeTitle.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(welcomeTitle)
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
    
    func setupTextFieldPassword(){
        passWordTextField = UITextField()
        passWordTextField.placeholder = "Password"
        passWordTextField.borderStyle = .roundedRect
        passWordTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(passWordTextField)
    }
    
    func setUpSubmitButton(){
        submitButton = UIButton(type: .system)
        submitButton.setTitle("Submit", for: .normal)
        submitButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(submitButton)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            appTitle.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor , constant: 22),
            appTitle.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            sloganTitle.topAnchor.constraint(equalTo: appTitle.bottomAnchor , constant: 18),
            sloganTitle.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            welcomeTitle.topAnchor.constraint(equalTo: sloganTitle.bottomAnchor , constant: 50),
            welcomeTitle.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            userNameTextField.topAnchor.constraint(equalTo: welcomeTitle.bottomAnchor , constant: 70),
            userNameTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            userNameTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            userNameTextField.heightAnchor.constraint(equalToConstant: 46),
            
            emailTextField.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor , constant: 42),
            emailTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            emailTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            emailTextField.heightAnchor.constraint(equalToConstant: 46),
            
            dateOfBirthTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor , constant: 42),
            dateOfBirthTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            dateOfBirthTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            dateOfBirthTextField.heightAnchor.constraint(equalToConstant: 46),
            
            passWordTextField.topAnchor.constraint(equalTo: dateOfBirthTextField.bottomAnchor , constant: 42),
            passWordTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            passWordTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            passWordTextField.heightAnchor.constraint(equalToConstant: 46),
            
            submitButton.topAnchor.constraint(equalTo: passWordTextField.bottomAnchor , constant: 50),
            submitButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
