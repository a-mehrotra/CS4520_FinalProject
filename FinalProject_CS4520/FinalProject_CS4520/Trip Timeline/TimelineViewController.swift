//
//  TimelineViewController.swift
//  FinalProject_CS4520
//
//  Created by John Rodrigues on 6/23/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class TimelineViewController: UIViewController {
    
    let timelineView = TimelineView()
    var currentUser:FirebaseAuth.User?
    var postsArray = [Post]()
    
    let database = Firestore.firestore()

    override func loadView() {
        view = timelineView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Timeline"
        
        //MARK: patching table view delegate and data source...
        timelineView.timeline.delegate = self
        timelineView.timeline.dataSource = self
        
        //MARK: removing the separator line...
        timelineView.timeline.separatorStyle = .none
        
        //MARK: Put the floating button above all the views...
        view.bringSubviewToFront(timelineView.floatingButtonAddChat)
        
        //MARK: tapping the floating add chat button...
        timelineView.floatingButtonAddChat.addTarget(self, action: #selector(addComment), for: .touchUpInside)
    }
    
    @objc func addComment(){
        let addCommentViewController = AddCommentViewController()
        addCommentViewController.currentUser = currentUser
        navigationController?.pushViewController(addCommentViewController, animated: true)
    }

}
