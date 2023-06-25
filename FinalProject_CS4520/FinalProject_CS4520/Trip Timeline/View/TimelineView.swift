//
//  TimelineView.swift
//  FinalProject_CS4520
//
//  Created by John Rodrigues on 6/23/23.
//

import UIKit

class TimelineView: UIView {
    
    var timeline: UITableView!
    var floatingButtonAddChat: UIButton!
    let color = UIColor(red: 103, green: 71, blue: 200)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = color
        
        setupTimeline()
        setupFloatingButtonAddChat()
        initConstraints()
    }
    
    func setupTimeline() {
        timeline = UITableView(frame: .zero, style: .plain)
        timeline.register(TimelineTableViewCell.self, forCellReuseIdentifier: "tableViewTimeline")
        timeline.backgroundColor = color
        timeline.separatorColor = color
        timeline.tableFooterView = UIView()
        timeline.superview?.backgroundColor = UIColor(red: 103/255, green: 71/255, blue: 200/255, alpha: 1.0)
        timeline.backgroundView = UIView()
        timeline.backgroundView?.backgroundColor = UIColor(red: 103/255, green: 71/255, blue: 200/255, alpha: 1.0)
        timeline.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(timeline)
    }
    
    func setupFloatingButtonAddChat() {
        floatingButtonAddChat = UIButton(type: .system)
        floatingButtonAddChat.setTitle("", for: .normal)
        floatingButtonAddChat.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
        floatingButtonAddChat.contentHorizontalAlignment = .fill
        floatingButtonAddChat.contentVerticalAlignment = .fill
        floatingButtonAddChat.imageView?.contentMode = .scaleAspectFit
        floatingButtonAddChat.layer.cornerRadius = 16
        floatingButtonAddChat.imageView?.layer.shadowOffset = .zero
        floatingButtonAddChat.imageView?.layer.shadowRadius = 0.8
        floatingButtonAddChat.imageView?.layer.shadowOpacity = 0.7
        floatingButtonAddChat.imageView?.clipsToBounds = true
        floatingButtonAddChat.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(floatingButtonAddChat)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            timeline.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            timeline.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            timeline.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            timeline.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            floatingButtonAddChat.widthAnchor.constraint(equalToConstant: 40),
            floatingButtonAddChat.heightAnchor.constraint(equalToConstant: 40),
            floatingButtonAddChat.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            floatingButtonAddChat.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
