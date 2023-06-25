//
//  ProfileSettingView.swift
//  FinalProject_CS4520
//
//  Created by Lâm Trương on 6/18/23.
//

import UIKit

class ProfileSettingView: UIView {

    var buttonImage: UIButton!
    var userNameTextField: UITextField!
    var dateOfBirthTextField: UITextField!
    var bioTextField: UITextField!

    var saveButton: UIButton!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let color = UIColor(red: 103, green: 71, blue: 200)
        self.backgroundColor = color
        setupbuttonTakePhoto()
        setupTextFieldUserName()
        setupTextFieldDateOfBirth()
        setupTextFieldBio()
        setUpSaveButton()
        
        initConstraints()
    }
    
    func setupbuttonTakePhoto(){
        buttonImage = UIButton(type: .system)
        buttonImage.setTitle("", for: .normal)
        buttonImage.setImage(UIImage(systemName: "person"), for: .normal)
        buttonImage.contentHorizontalAlignment = .fill
        buttonImage.contentVerticalAlignment = .fill
        buttonImage.imageView?.contentMode = .scaleAspectFit
        buttonImage.showsMenuAsPrimaryAction = true
        buttonImage.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonImage)
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

    func setUpSaveButton(){
        saveButton = UIButton(type: .system)
        saveButton.setTitle("Save", for: .normal)
        saveButton.layer.cornerRadius = 15.0
        saveButton.backgroundColor = UIColor(red: 54, green: 10, blue: 138)
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        saveButton.contentEdgeInsets =  UIEdgeInsets(top: 8, left: 30, bottom: 8, right: 30)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(saveButton)
    }

    func initConstraints(){
        NSLayoutConstraint.activate([
            buttonImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
            buttonImage.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonImage.widthAnchor.constraint(equalToConstant: 120),
            buttonImage.heightAnchor.constraint(equalToConstant: 120),
            
            userNameTextField.topAnchor.constraint(equalTo: buttonImage.bottomAnchor , constant: 44),
            userNameTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            userNameTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            userNameTextField.heightAnchor.constraint(equalToConstant: 46),
            
            dateOfBirthTextField.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor , constant: 44),
            dateOfBirthTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            dateOfBirthTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            dateOfBirthTextField.heightAnchor.constraint(equalToConstant: 46),
            
            bioTextField.topAnchor.constraint(equalTo: dateOfBirthTextField.bottomAnchor , constant: 44),
            bioTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            bioTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            bioTextField.heightAnchor.constraint(equalToConstant: 120),
            
            saveButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,constant: -20),
            saveButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

