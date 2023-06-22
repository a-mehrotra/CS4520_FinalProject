//
//  AddTripView.swift
//  FinalProject_CS4520
//
//  Created by Lâm Trương on 6/19/23.
//

import UIKit

class AddTripView: UIView {
    
    var destinationTextField: UITextField!
    var arrivalDateTextField: UITextField!
    var departureDateTextField: UITextField!
    var visaLengthTextField: UITextField!
    var tripDescriptionTextField: UITextField!

    var submitButton: UIButton!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let color = UIColor(red: 103, green: 71, blue: 200)
        self.backgroundColor = color
        setupDestinationTextField()
        setupTextFieldArrivalDate()
        setupTextFieldDepartureDate()
        setupTextFieldVisaLength()
        setupTextFieldTripDescription()
        setUpSubmitButton()
        initConstraints()
    }
    
    func setupDestinationTextField(){
        destinationTextField = UITextField()
        destinationTextField.placeholder = "Destination"
        destinationTextField.leftViewMode = .always
        destinationTextField.leftView = UIView(frame: CGRect(x:0,y:0,width:8,height:0))
        destinationTextField.layer.cornerRadius = 15.0
//        userNameTextField.layer.borderWidth = 2.0
        destinationTextField.backgroundColor = .white
        destinationTextField.layer.borderColor = UIColor.white.cgColor
        destinationTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(destinationTextField)
    }
    
    func setupTextFieldArrivalDate(){
        arrivalDateTextField = UITextField()
        arrivalDateTextField.placeholder = "MM/DD/YY"
        arrivalDateTextField.leftViewMode = .always
        arrivalDateTextField.leftView = UIView(frame: CGRect(x:0,y:0,width:8,height:0))
        arrivalDateTextField.layer.cornerRadius = 15.0
//        userNameTextField.layer.borderWidth = 2.0
        arrivalDateTextField.backgroundColor = .white
        arrivalDateTextField.layer.borderColor = UIColor.white.cgColor
        arrivalDateTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(arrivalDateTextField)
        
        
    }
    
    func setupTextFieldDepartureDate(){
        departureDateTextField = UITextField()
        departureDateTextField.placeholder = "MM/DD/YY"
        departureDateTextField.leftViewMode = .always
        departureDateTextField.leftView = UIView(frame: CGRect(x:0,y:0,width:8,height:0))
        departureDateTextField.layer.cornerRadius = 15.0
//        userNameTextField.layer.borderWidth = 2.0
        departureDateTextField.backgroundColor = .white
        departureDateTextField.layer.borderColor = UIColor.white.cgColor
        departureDateTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(departureDateTextField)
    }
    
    func setupTextFieldVisaLength(){
        visaLengthTextField = UITextField()
        visaLengthTextField.placeholder = "Visa Length"
        visaLengthTextField.leftViewMode = .always
        visaLengthTextField.leftView = UIView(frame: CGRect(x:0,y:0,width:8,height:0))
        visaLengthTextField.layer.cornerRadius = 15.0
//        userNameTextField.layer.borderWidth = 2.0
        visaLengthTextField.backgroundColor = .white
        visaLengthTextField.layer.borderColor = UIColor.white.cgColor
        visaLengthTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(visaLengthTextField)
    }
    
    func setupTextFieldTripDescription(){
        tripDescriptionTextField = UITextField()
        tripDescriptionTextField.placeholder = "Trip Description"
        tripDescriptionTextField.leftViewMode = .always
        tripDescriptionTextField.leftView = UIView(frame: CGRect(x:0,y:0,width:8,height:0))
        tripDescriptionTextField.layer.cornerRadius = 15.0
//        userNameTextField.layer.borderWidth = 2.0
        tripDescriptionTextField.backgroundColor = .white
        tripDescriptionTextField.layer.borderColor = UIColor.white.cgColor
        tripDescriptionTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tripDescriptionTextField)
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
            destinationTextField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor , constant: 62),
            destinationTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            destinationTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            destinationTextField.heightAnchor.constraint(equalToConstant: 46),
            
            arrivalDateTextField.topAnchor.constraint(equalTo: destinationTextField.bottomAnchor , constant: 42),
            arrivalDateTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            arrivalDateTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            arrivalDateTextField.heightAnchor.constraint(equalToConstant: 46),
            
            departureDateTextField.topAnchor.constraint(equalTo: arrivalDateTextField.bottomAnchor , constant: 42),
            departureDateTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            departureDateTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            departureDateTextField.heightAnchor.constraint(equalToConstant: 46),
            
            visaLengthTextField.topAnchor.constraint(equalTo: departureDateTextField.bottomAnchor , constant: 42),
            visaLengthTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            visaLengthTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            visaLengthTextField.heightAnchor.constraint(equalToConstant: 46),
            
            tripDescriptionTextField.topAnchor.constraint(equalTo: visaLengthTextField.bottomAnchor , constant: 42),
            tripDescriptionTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            tripDescriptionTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            tripDescriptionTextField.heightAnchor.constraint(equalToConstant: 120),
            
            submitButton.topAnchor.constraint(equalTo: tripDescriptionTextField.bottomAnchor , constant: 50),
            submitButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
