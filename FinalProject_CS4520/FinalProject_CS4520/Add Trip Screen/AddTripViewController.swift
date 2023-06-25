//
//  AddTripViewController.swift
//  FinalProject_CS4520
//
//  Created by Lâm Trương on 6/19/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class AddTripViewController: UIViewController {
    
    let addTripView = AddTripView()
    var datePickerArrival: UIDatePicker!
    var dateArrival = Date()
    var dateDeparture = Date()
    var datePickerDeparture: UIDatePicker!
    let childProgressView = ProgressSpinnerViewController()
    let database = Firestore.firestore()
    var currentUser:FirebaseAuth.User?
    let notificationCenter = NotificationCenter.default
    
    override func loadView() {
        view = addTripView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showDatePickerArrival()
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        view.addGestureRecognizer(tapRecognizer)
        addTripView.submitButton.addTarget(self, action: #selector(submitButtonPressed), for: .touchUpInside)
        
        changeNavColorToWhite()
    }
    
    func changeNavColorToWhite() {
        // Create a new instance of UIBarButtonItemAppearance
        let appearance = UIBarButtonItemAppearance()

        // Set the color of the back button
        appearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white]

        // Apply the appearance to the navigation bar
        navigationController?.navigationBar.tintColor = .white

    }
    
    @objc func hideKeyboardOnTap(){
        //MARK: removing the keyboard from screen...
        view.endEditing(true)
    }
    
    @objc func submitButtonPressed() {
        if let destination = addTripView.destinationTextField.text, let arrivalDate = addTripView.arrivalDateTextField.text, let departureDate = addTripView.departureDateTextField.text, let tripDescription = addTripView.tripDescriptionTextField.text, let visaLength = addTripView.visaLengthTextField.text {
            if !destination.isEmpty && !arrivalDate.isEmpty && !departureDate.isEmpty && !tripDescription.isEmpty && !visaLength.isEmpty {
                self.showActivityIndicator()
              
                let dateFormatter = DateFormatter()
                sendDataToFireBase(destination: destination, arrivalDate: dateArrival, departureDate: dateDeparture, createdBy: (currentUser?.email)!, userArray: [(currentUser?.uid)!], tripDescription: tripDescription, isSchengen: false, visaLength: visaLength)
            }
            else {
                showErrorAlert("Fields must not be empty")
            }
            
        }
    }
    
    func sendDataToFireBase(destination: String, arrivalDate: Date, departureDate:Date, createdBy: String, userArray: [String], tripDescription: String, isSchengen: Bool, visaLength: String) {
        database.collection("trips").addDocument(data: ["destination": destination,
                                                        "arrivalDate": arrivalDate,
                                                        "departureDate": departureDate,
                                                        "createdBy": createdBy,
                                                        "userArray": userArray,
                                                        "tripDescription": tripDescription,
                                                        "isSchengen": isSchengen,
                                                        "visaLength": visaLength], completion: {error in
            
            if error == nil {
                self.hideActivityIndicator()
                self.notificationCenter.post(name: .tripAdded, object: "success")
                self.navigationController?.popViewController(animated: true)
                
            }
            else {
                self.hideActivityIndicator()
                self.showErrorAlert("Trip could not be added to the database. Try again")
            }
            
        })
    }
    
    func showDatePickerArrival() {
        let loc = Locale(identifier: "en_us")
        
        
        datePickerArrival = UIDatePicker()
        datePickerArrival.locale = loc
        datePickerArrival.datePickerMode = .date
        datePickerArrival?.preferredDatePickerStyle = .inline
        datePickerArrival?.addTarget(self, action: #selector(dateChangeArrival(datePicker:)), for: .valueChanged)
        datePickerArrival.maximumDate = Date()
        
        datePickerDeparture = UIDatePicker()
        datePickerDeparture.locale = loc
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
        dateArrival = datePicker.date
    }
    
    @objc func dateChangeDeparture(datePicker: UIDatePicker){
        addTripView.departureDateTextField.text = formatDate(date: datePicker.date)
        dateDeparture = datePicker.date
    }
    
    func formatDate(date: Date) -> String{
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_us")
        formatter.dateFormat = "MMMM dd yyyy"
        return formatter.string(from: date)
    }
    
    func showErrorAlert(_ text: String){
        let alert = UIAlertController(title: "Error!", message: text, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }

}
