//
//  AddPostView.swift
//  FinalProject_CS4520
//
//  Created by Lâm Trương on 6/20/23.
//

import UIKit

class AddPostView: UIView {

    var createPostLable: UILabel!
    
    var captionTextField: UITextField!
    var locationTextField: UITextField!
    var dateAndTimeTextField: UITextField!
    
    var submitButton: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        let color = UIColor(red: 103, green: 71, blue: 200)
        self.backgroundColor = color
        setUpCreatePostTitle()
        
        setupTextFieldCaption()
        setupTextFieldLocation()
        setupTextFieldDateAndTime()
        setUpSubmitButton()
        
        initConstraints()
    }
    
    func setUpLogoImage(){
        
    }
    
    
    func setUpCreatePostTitle(){
        createPostLable = UILabel()
        createPostLable.text = "Create Post"
        createPostLable.textColor = .white
        createPostLable.font = UIFont.boldSystemFont(ofSize: 44)
        createPostLable.textAlignment = .center
        createPostLable.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(createPostLable)
    }
    
    func setupTextFieldCaption(){
        captionTextField = UITextField()
        captionTextField.placeholder = "Caption"
        captionTextField.leftViewMode = .always
        captionTextField.leftView = UIView(frame: CGRect(x:0,y:0,width:5,height:0))
        captionTextField.layer.cornerRadius = 15.0
//        userNameTextField.layer.borderWidth = 2.0
        captionTextField.backgroundColor = .white
        captionTextField.layer.borderColor = UIColor.white.cgColor
        captionTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(captionTextField)
    }
    
    func setupTextFieldLocation(){
        locationTextField = UITextField()
        locationTextField.placeholder = "Location"
        locationTextField.leftViewMode = .always
        locationTextField.leftView = UIView(frame: CGRect(x:0,y:0,width:5,height:0))
        locationTextField.layer.cornerRadius = 15.0
//        userNameTextField.layer.borderWidth = 2.0
        locationTextField.backgroundColor = .white
        locationTextField.layer.borderColor = UIColor.white.cgColor
        locationTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(locationTextField)
    }
    
    
    func setupTextFieldDateAndTime(){
        dateAndTimeTextField = UITextField()
        dateAndTimeTextField.placeholder = "MM/DD/YY"
        dateAndTimeTextField.leftViewMode = .always
        dateAndTimeTextField.leftView = UIView(frame: CGRect(x:0,y:0,width:5,height:0))
        dateAndTimeTextField.layer.cornerRadius = 15.0
//        userNameTextField.layer.borderWidth = 2.0
        dateAndTimeTextField.backgroundColor = .white
        dateAndTimeTextField.layer.borderColor = UIColor.white.cgColor
        dateAndTimeTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(dateAndTimeTextField)
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
            createPostLable.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor , constant: 22),
            createPostLable.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            captionTextField.topAnchor.constraint(equalTo: createPostLable.bottomAnchor , constant: 70),
            captionTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            captionTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            captionTextField.heightAnchor.constraint(equalToConstant: 46),
            
            locationTextField.topAnchor.constraint(equalTo: captionTextField.bottomAnchor , constant: 42),
            locationTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            locationTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            locationTextField.heightAnchor.constraint(equalToConstant: 46),
            
            dateAndTimeTextField.topAnchor.constraint(equalTo: locationTextField.bottomAnchor , constant: 42),
            dateAndTimeTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            dateAndTimeTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            dateAndTimeTextField.heightAnchor.constraint(equalToConstant: 46),
            
            submitButton.topAnchor.constraint(equalTo: dateAndTimeTextField.bottomAnchor , constant: 50),
            submitButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
