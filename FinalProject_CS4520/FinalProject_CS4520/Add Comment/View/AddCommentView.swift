//
//  AddCommentView.swift
//  WA8_Rodrigues_3891
//
//  Created by John Rodrigues on 6/13/23.
//

import UIKit

class AddCommentView: UIView {
    var messageBox: UIView!
    var messageText: UITextView!
    var submitButton: UIButton!
    var contentWrapper:UIScrollView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupContentWrapper()
        setupMessageBox()
        setupMessageText()
        setupSubmitButton()
        initConstraints()
    }
    
    func setupMessageBox() {
        messageBox = UIView()
        messageBox.translatesAutoresizingMaskIntoConstraints = false
        
        contentWrapper.addSubview(messageBox)
    }
    
    func setupMessageText() {
        messageText = UITextView()
        messageText.font = UIFont.systemFont(ofSize: 16)
        messageText.layer.cornerRadius = 10
        messageText.layer.borderWidth = 1
        messageText.layer.borderColor = UIColor.black.cgColor
        messageText.translatesAutoresizingMaskIntoConstraints = false
        messageText.delegate = self
        
        messageBox.addSubview(messageText)
    }
    
    func setupSubmitButton() {
        submitButton = UIButton(type: .system)
        submitButton.setTitle("Submit", for: .normal)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        
        messageBox.addSubview(submitButton)
    }
    
    //MARK: setting up UI elements...
    func setupContentWrapper(){
        contentWrapper = UIScrollView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            contentWrapper.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            contentWrapper.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            contentWrapper.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 25),
            contentWrapper.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            contentWrapper.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            messageBox.topAnchor.constraint(equalTo: contentWrapper.topAnchor),
            messageBox.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor),
            messageBox.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor),
            messageBox.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            
            messageText.topAnchor.constraint(equalTo: messageBox.topAnchor, constant: 8),
            messageText.leadingAnchor.constraint(equalTo: messageBox.leadingAnchor, constant: 8),
            messageText.trailingAnchor.constraint(equalTo: messageBox.trailingAnchor, constant: -8),
            messageText.bottomAnchor.constraint(equalTo: submitButton.topAnchor, constant: -8),
            messageText.heightAnchor.constraint(greaterThanOrEqualToConstant: 30),
            messageText.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            
            submitButton.leadingAnchor.constraint(equalTo: messageBox.leadingAnchor, constant: 8),
            submitButton.trailingAnchor.constraint(equalTo: messageBox.trailingAnchor, constant: -8),
            submitButton.bottomAnchor.constraint(equalTo: messageBox.bottomAnchor, constant: -8),
            submitButton.heightAnchor.constraint(equalToConstant: 50),
            submitButton.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// https://stackoverflow.com/questions/55196142/how-to-resize-a-uitextview-that-automatically-resize-its-width-and-height-based
extension AddCommentView: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        let fixedWidth = textView.frame.size.width
        let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: .greatestFiniteMagnitude))
        textView.frame.size = CGSize(width: fixedWidth, height: max(newSize.height, 30))
        messageText.constraints.forEach { constraint in
            if constraint.firstAttribute == .height {
                constraint.constant = max(newSize.height, 30)
            }
        }
        self.layoutIfNeeded()
        
        // Set the content size of the contentWrapper
        let totalHeight = messageBox.frame.height + 16
        contentWrapper.contentSize = CGSize(width: frame.width, height: totalHeight)
    }
}
