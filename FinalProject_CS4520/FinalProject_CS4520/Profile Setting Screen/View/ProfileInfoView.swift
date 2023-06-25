//
//  ProfileInfoView.swift
//  FinalProject_CS4520
//
//  Created by Aleksei Shilov on 6/25/23.
//

import UIKit

class ProfileInfoView: UIView {

    var imageProfile: UIImageView!
    
    var userNameLabel: UILabel!
    var dateOfBirthLabel: UILabel!
    var bioLabel: UILabel!
    var bioInfoLabel: UILabel!

    var editProfleButton: UIButton!
    var signOutButton: UIButton!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let color = UIColor(red: 103, green: 71, blue: 200)
        self.backgroundColor = color
        setUpLogoImage()
        setupLabelUserName()
        setupLabelDateOfBirth()
        setupLabelBio()
        setupLabelBioInfo()
        setUpEditProfileButton()
        setUpSaveInfoButton()
        
        initConstraints()
    }
    
    func setUpLogoImage(){
        imageProfile = UIImageView()
        imageProfile.image = UIImage(systemName: "person")
        imageProfile.contentMode = .scaleToFill
        imageProfile.clipsToBounds = true
        imageProfile.layer.cornerRadius = 10
        imageProfile.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageProfile)
    }
    
    func setupLabelUserName(){
        userNameLabel = UILabel()
        userNameLabel.font = UIFont.boldSystemFont(ofSize: 22)
        userNameLabel.textColor = .black
        userNameLabel.textAlignment = .center
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(userNameLabel)
    }
    

    func setupLabelDateOfBirth(){
        dateOfBirthLabel = UILabel()
        dateOfBirthLabel.font = UIFont.systemFont(ofSize: 14)
        dateOfBirthLabel.textColor = .black
        dateOfBirthLabel.textAlignment = .center
        dateOfBirthLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(dateOfBirthLabel)
    }
    
    func setupLabelBio(){
        bioLabel = UILabel()
        bioLabel.text = "Bio"
        bioLabel.font = UIFont.boldSystemFont(ofSize: 26)
        bioLabel.textColor = .black
        bioLabel.textAlignment = .center
        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(bioLabel)
    }
    
    func setupLabelBioInfo(){
        bioInfoLabel = UILabel()
        bioInfoLabel.font = UIFont.systemFont(ofSize: 18)
        bioInfoLabel.numberOfLines = 0
        bioInfoLabel.textColor = .black
        bioInfoLabel.textAlignment = .center
        bioInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(bioInfoLabel)
    }
    
    func setUpEditProfileButton(){
        editProfleButton = UIButton(type: .system)
        editProfleButton.setTitle("Edit", for: .normal)
        editProfleButton.layer.cornerRadius = 15.0
        editProfleButton.backgroundColor = UIColor(red: 54, green: 10, blue: 138)
        editProfleButton.setTitleColor(.white, for: .normal)
        editProfleButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        editProfleButton.contentEdgeInsets =  UIEdgeInsets(top: 8, left: 46, bottom: 8, right: 46)
        editProfleButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(editProfleButton)
    }

    func setUpSaveInfoButton(){
        signOutButton = UIButton(type: .system)
        signOutButton.setTitle("Sign Out", for: .normal)
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
            imageProfile.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor , constant: 22),
            imageProfile.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            imageProfile.heightAnchor.constraint(equalToConstant: 120),
            imageProfile.widthAnchor.constraint(equalToConstant: 120),
            
            userNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor , constant: 40),
            userNameLabel.leadingAnchor.constraint(equalTo: imageProfile.trailingAnchor, constant: 10),
            userNameLabel.heightAnchor.constraint(equalToConstant: 27),
            
            dateOfBirthLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 7),
            dateOfBirthLabel.leadingAnchor.constraint(equalTo: imageProfile.trailingAnchor, constant: 10),
            dateOfBirthLabel.heightAnchor.constraint(equalToConstant: 27),
             
            bioLabel.topAnchor.constraint(equalTo: imageProfile.bottomAnchor , constant: 40),
            bioLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            bioInfoLabel.topAnchor.constraint(equalTo: bioLabel.bottomAnchor , constant: 20),
            bioInfoLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            bioInfoLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            bioInfoLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            signOutButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,constant: -10),
            signOutButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            editProfleButton.bottomAnchor.constraint(equalTo: signOutButton.topAnchor,constant: -14),
            editProfleButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor)
    

        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

