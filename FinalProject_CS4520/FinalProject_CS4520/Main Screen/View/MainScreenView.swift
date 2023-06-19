//
//  MainScreenView.swift
//  FinalProject_CS4520
//
//  Created by Lâm Trương on 6/18/23.
//

import UIKit

class MainScreenView: UIView {
    
    var appTitle: UILabel!
    var sloganTitle: UILabel!
    var welcomeBackTitle: UILabel!
    var welcomeTitle: UILabel!
    
    var loginButton: UIButton!
    var signupButton: UIButton!
    
    var logoImage: UIImage!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let color2 = UIColor(red: 103, green: 71, blue: 200)
        self.backgroundColor = color2
        setUpAppTitle()
        setUpSloganTitle()
        setUpWelcomeBackTitle()
        setUpWelcomeTitle()
        setUpLoginButton()
        setUpSignUpButton()
        
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
    
    func setUpWelcomeBackTitle(){
        welcomeBackTitle = UILabel()
        welcomeBackTitle.textColor = .white
        welcomeBackTitle.text = "Welcome Back!"
        welcomeBackTitle.font = UIFont.systemFont(ofSize: 18)
        welcomeBackTitle.textAlignment = .center
        welcomeBackTitle.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(welcomeBackTitle)
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
    
    func setUpLoginButton(){
        loginButton = UIButton(type: .system)
        loginButton.setTitle("Login", for: .normal)
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(loginButton)
    }
    
    func setUpSignUpButton(){
        signupButton = UIButton(type: .system)
        signupButton.setTitle("SignUp", for: .normal)
        signupButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        signupButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(signupButton)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            appTitle.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor , constant: 25),
            appTitle.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            sloganTitle.topAnchor.constraint(equalTo: appTitle.bottomAnchor , constant: 40),
            sloganTitle.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            welcomeBackTitle.topAnchor.constraint(equalTo: sloganTitle.bottomAnchor , constant: 120),
            welcomeBackTitle.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            loginButton.topAnchor.constraint(equalTo: welcomeBackTitle.bottomAnchor , constant: 20),
            loginButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            welcomeTitle.topAnchor.constraint(equalTo: loginButton.bottomAnchor , constant: 40),
            welcomeTitle.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            signupButton.topAnchor.constraint(equalTo: welcomeTitle.bottomAnchor , constant: 20),
            signupButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            
            
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}
