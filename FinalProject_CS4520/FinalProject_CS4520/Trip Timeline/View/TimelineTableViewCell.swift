//
//  TimelineTableViewCell.swift
//  FinalProject_CS4520
//
//  Created by John Rodrigues on 6/23/23.
//

import UIKit

class TimelineTableViewCell: UITableViewCell {
    
    var wrapperCellView: UIView!
    var labelUsername: UILabel!
    var labelDate: UILabel!
    var labelCaption: UILabel!
    var locationButton: UIButton!
    var commentsButton: UIButton!
    var likesButton: UIButton!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let color = UIColor(red: 103/255, green: 71/255, blue: 200/255, alpha: 1.0)
        self.backgroundColor = color
        setupWrapperCellView()
        setupUsername()
        setupDate()
        setupCaption()
        setupLocation()
        setupComments()
        setupLikes()
        initConstraints()
    }
    
    func setupWrapperCellView() {
        wrapperCellView = UIView()
        wrapperCellView.backgroundColor = .white
        wrapperCellView.layer.cornerRadius = 15.0
        wrapperCellView.layer.shadowColor = UIColor.gray.cgColor
        wrapperCellView.layer.shadowOffset = .zero
        wrapperCellView.layer.shadowRadius = 4.0
        wrapperCellView.layer.shadowOpacity = 0.4
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }
    
    func setupUsername() {
        labelUsername = UILabel()
        labelUsername.font = UIFont.boldSystemFont(ofSize: 22)
        labelUsername.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelUsername)
    }
    
    func setupDate() {
        labelDate = UILabel()
        labelDate.font = UIFont.italicSystemFont(ofSize: 22)
        labelDate.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelDate)
    }
    
    func setupCaption() {
        labelCaption = UILabel()
        labelCaption.font = UIFont.systemFont(ofSize: 14)
        labelCaption.numberOfLines = 0
        labelCaption.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelCaption)
    }
    
    func setupLocation() {
        locationButton = UIButton()
        locationButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        locationButton.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(locationButton)
    }
    
    func setupComments() {
        commentsButton = UIButton()
        commentsButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        commentsButton.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(commentsButton)
    }
    
    func setupLikes() {
        likesButton = UIButton()
        likesButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        likesButton.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(likesButton)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 6),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -6),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            labelUsername.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 10),
            labelUsername.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 10),
            
            labelDate.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 10),
            labelDate.leadingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: -10),
            
            labelCaption.topAnchor.constraint(equalTo: labelUsername.bottomAnchor, constant: 10),
            labelCaption.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 10),
            labelCaption.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: -10),
            
            locationButton.bottomAnchor.constraint(equalTo: wrapperCellView.bottomAnchor, constant: -10),
            locationButton.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 10),
            
            commentsButton.bottomAnchor.constraint(equalTo: wrapperCellView.bottomAnchor, constant: -10),
            commentsButton.leadingAnchor.constraint(equalTo: locationButton.trailingAnchor, constant: 10),
            
            likesButton.bottomAnchor.constraint(equalTo: wrapperCellView.bottomAnchor, constant: -10),
            likesButton.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: -10),
        ])
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
