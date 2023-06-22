//
//  AddTripViewController.swift
//  FinalProject_CS4520
//
//  Created by Lâm Trương on 6/19/23.
//

import UIKit

class AddTripViewController: UIViewController {
    
    let addTripView = AddTripView()
    var datePickerArrival: UIDatePicker!
    var datePickerDeparture: UIDatePicker!
    
    override func loadView() {
        view = addTripView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showDatePickerArrival()
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        view.addGestureRecognizer(tapRecognizer)
    }
    
    @objc func hideKeyboardOnTap(){
        //MARK: removing the keyboard from screen...
        view.endEditing(true)
    }
    
    func showDatePickerArrival() {
        datePickerArrival = UIDatePicker()
        datePickerArrival.datePickerMode = .date
        datePickerArrival?.preferredDatePickerStyle = .inline
        datePickerArrival?.addTarget(self, action: #selector(dateChangeArrival(datePicker:)), for: .valueChanged)
        datePickerArrival.maximumDate = Date()
        
        datePickerDeparture = UIDatePicker()
        datePickerDeparture.datePickerMode = .date
        datePickerDeparture?.preferredDatePickerStyle = .inline
        datePickerDeparture?.addTarget(self, action: #selector(dateChangeDeparture(datePicker:)), for: .valueChanged)
        datePickerDeparture.maximumDate = Date()
        
        addTripView.arrivalDateTextField.inputView = datePickerArrival
        addTripView.departureDateTextField.inputView = datePickerDeparture
        addTripView.arrivalDateTextField.text = formatDate(date: Date())
        addTripView.departureDateTextField.text = formatDate(date: Date())
    }
    
    @objc func dateChangeArrival(datePicker: UIDatePicker){
        addTripView.arrivalDateTextField.text = formatDate(date: datePicker.date)
    }
    
    @objc func dateChangeDeparture(datePicker: UIDatePicker){
        addTripView.departureDateTextField.text = formatDate(date: datePicker.date)
    }
    
    func formatDate(date: Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd yyyy"
        return formatter.string(from: date)
    }
}
