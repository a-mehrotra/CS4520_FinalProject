////
////  AddCommentViewController.swift
////  FinalProject_CS4520
////
////  Created by John Rodrigues on 6/23/23.
////
//
//import UIKit
//
//class AddCommentViewController: UIViewController {
//    let AddComment = AddCommentView()
//    var currentUser:FirebaseAuth.User?
//    let database = Firestore.firestore()
//    let childProgressView = ProgressSpinnerViewController()
//    var recipient = ""
//    
//    override func loadView() {
//        view = AddComment
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        title = "Add comment to Post"
//        
//        AddComment.submitButton.addTarget(self, action: #selector(onButtonTapped), for: .touchUpInside)
//        
//        //MARK: recognizing the taps on the app screen, not the keyboard...
//        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
//        view.addGestureRecognizer(tapRecognizer)
//    }
//    
//    //MARK: Hide Keyboard...
//    @objc func hideKeyboardOnTap(){
//        //MARK: removing the keyboard from screen...
//        view.endEditing(true)
//    }
//    
//    @objc func onButtonTapped() {
//        let comment = AddComment.commentText.text!
//        let username = currentUser?.displayName
//        
//        let currentTimestamp = Timestamp(date: Date())
//        let newComment = Comments(text: comment, commentTS: currentTimestamp, sender: username!)
//        
//        if (!comment.isEmpty && !recipient.isEmpty) {
//            self.addComment(username!, recipient, newComment)
//            self.AddComment.commentText.text = nil
//        } else if(comment.isEmpty && !recipient.isEmpty) {
//            showErrorAlert("Comment cannot be Empty!")
//        } else if(!comment.isEmpty && recipient.isEmpty) {
//            showErrorAlert("Error finding recipient!")
//        } else {
//            showErrorAlert("Comment fields cannot be Empty and trouble finding recipient!")
//        }
//    }
//    
//    func addComment(_ username: String, _ recipient: String, _ comment: Comments) {
//        let documentRef = database.collection("users").document(username).collection("posts").document(recipient)
//        let dictComment: [String: Any] = [
//            "text": comment.text,
//            "commentTS": comment.commentTS,
//            "sender": comment.sender
//        ]
//
//        documentRef.getDocument { (snapshot, error) in
//            if let error = error {
//                print("Error fetching document: \(error)")
//                return
//            }
//
//            if snapshot?.exists == true {
//                // Add comment to users posts
//                self.database.collection("users").document(username).collection("posts").document(recipient).collection("comments").addDocument(data: dictComment) { error in
//                    if let error = error {
//                        print("Error adding document: \(error)")
//                    } else {
//                        print("Document added successfully")
//                    }
//                }
//                
//                // Add comment to recipients posts
//                self.database.collection("users").document(recipient).collection("posts").document(username).collection("comments").addDocument(data: dictComment) { error in
//                    if let error = error {
//                        print("Error adding document: \(error)")
//                    } else {
//                        print("Document added successfully")
//                    }
//                }
//                
//                let currentTimestamp = Timestamp(date: Date())
//                
//                self.database.collection("users").document(recipient).collection("posts").document(username).updateData([
//                    "updatedTime": currentTimestamp
//                ]) { error in
//                    if let error = error {
//                        print("Error updating document: \(error)")
//                    } else {
//                        print("Document updated successfully")
//                    }
//                }
//                
//                self.database.collection("users").document(username).collection("posts").document(recipient).updateData([
//                    "updatedTime": currentTimestamp
//                ]) { error in
//                    if let error = error {
//                        print("Error updating document: \(error)")
//                    } else {
//                        print("Document updated successfully")
//                    }
//                }
//                
//                //MARK: pop the current controller...
//                self.navigationController?.popViewController(animated: true)
//            } else {
//                self.showErrorAlert("Error sending Comment!")
//            }
//        }
//    }
//    
//    func showErrorAlert(_ text: String){
//        let alert = UIAlertController(title: "Error!", comment: text, preferredStyle: .alert)
//        
//        alert.addAction(UIAlertAction(title: "OK", style: .default))
//        
//        self.present(alert, animated: true)
//    }
//      func changeNavColorToWhite() {
//    // Create a new instance of UIBarButtonItemAppearance
//    let appearance = UIBarButtonItemAppearance()
//
//    // Set the color of the back button
//    appearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white]
//
//    // Apply the appearance to the navigation bar
//    navigationController?.navigationBar.tintColor = .white
//
//}
//}
//
