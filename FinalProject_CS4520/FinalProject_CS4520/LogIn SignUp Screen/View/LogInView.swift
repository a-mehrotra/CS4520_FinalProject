//
//  LogInView.swift
//  FinalProject_CS4520
//
//  Created by Lâm Trương on 6/18/23.
//

import UIKit

class LogInView: UIView {
    var appTitle: UILabel!
    var sloganTitle: UILabel!
    var welcomeTitle: UILabel!
    
    var userNameTextField: UITextField!
    var passWordTextField: UITextField!
    

    var submitButton: UIButton!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let color = UIColor(red: 103, green: 71, blue: 200)
        self.backgroundColor = color
        setUpAppTitle()
        setUpSloganTitle()
        setUpWelcomeTitle()
        
        setupTextFieldUserName()
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
        userNameTextField.placeholder = "Email"
        userNameTextField.leftViewMode = .always
        userNameTextField.leftView = UIView(frame: CGRect(x:0,y:0,width:8,height:0))
        userNameTextField.layer.cornerRadius = 15.0
//        userNameTextField.layer.borderWidth = 2.0
        userNameTextField.backgroundColor = .white
        userNameTextField.layer.borderColor = UIColor.white.cgColor
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(userNameTextField)
    }
    
    func setupTextFieldPassword(){
        passWordTextField = UITextField()
        passWordTextField.placeholder = "Password"
        passWordTextField.leftViewMode = .always
        passWordTextField.leftView = UIView(frame: CGRect(x:0,y:0,width:8,height:0))
        passWordTextField.layer.cornerRadius = 15.0
//        passWordTextField.layer.borderWidth = 2.0
        passWordTextField.backgroundColor = .white
        passWordTextField.layer.borderColor = UIColor.white.cgColor
        passWordTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(passWordTextField)
    }
    
    func setUpSubmitButton(){
        submitButton = UIButton(type: .system)
        submitButton.setTitle("Submit", for: .normal)
        submitButton.layer.cornerRadius = 15.0
        submitButton.backgroundColor = UIColor(red: 54, green: 10, blue: 138)
        submitButton.setTitleColor(.white, for: .normal)
        submitButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        submitButton.contentEdgeInsets =  UIEdgeInsets(top: 8, left: 30, bottom: 8, right: 30)
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
            
            passWordTextField.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor , constant: 42),
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

