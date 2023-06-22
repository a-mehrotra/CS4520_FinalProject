//
//  AddPostViewController.swift
//  FinalProject_CS4520
//
//  Created by Lâm Trương on 6/20/23.
//

import UIKit

class AddPostViewController: UIViewController {

    let addPostView = AddPostView()
    var datePicker: UIDatePicker!
    
    override func loadView() {
        view = addPostView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showDatePicker()
        // Do any additional setup after loading the view.
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        view.addGestureRecognizer(tapRecognizer)
    }
    
    @objc func hideKeyboardOnTap(){
        //MARK: removing the keyboard from screen...
        view.endEditing(true)
    }
    
    func showDatePicker() {
        datePicker = UIDatePicker()
        datePicker.datePickerMode = .date

        datePicker?.preferredDatePickerStyle = .inline
        datePicker?.addTarget(self, action: #selector(dateChange(datePicker:)), for: .valueChanged)
        datePicker.maximumDate = Date()
     
        addPostView.dateAndTimeTextField.inputView = datePicker
        addPostView.dateAndTimeTextField.text = formatDate(date: Date())
        
    }
    
    @objc func dateChange(datePicker: UIDatePicker){
        addPostView.dateAndTimeTextField.text = formatDate(date: datePicker.date)
    }
    
    func formatDate(date: Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd yyyy"
        return formatter.string(from: date)
    }

}
