//
//  AddPartyViewController.swift
//  MyPartyApp
//
//  Created by Nora Alhelal on 11/18/16.
//  Copyright © 2016 gwu. All rights reserved.
//

import UIKit

class AddPartyViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {
    
    // MARK: Properties
      //Set up connections with the text fields in the story board

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var startDateTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    var party: Party?
    let persistance = Persistance()

    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field’s user input through delegate callbacks.
        nameTextField.delegate = self
        
        // Enable the Save button only if the text field has a valid Meal name.
        checkValidName()
    }
    
    
    // MARK: UITextFieldDelegate
 
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Disable the Save button while editing.
        saveButton.isEnabled = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        checkValidName()
        navigationItem.title = textField.text
    }
    
    
    func checkValidName() {
        // Disable the Save button if the text field is empty.
        let text = nameTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }

    // MARK: Navigation
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    // This method lets you configure a view controller before it's presented.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (saveButton === sender as AnyObject)  {
            //     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            //        if let barButton = sender as? UIBarButtonItem {
            //            if saveButton === barButton {
            let name = nameTextField.text ?? ""
            let startDate = startDateTextField.text ?? ""
            let address = addressTextField.text ?? ""
            
            // Set the party to be passed to PartyTabelViewContoller after the unwind segue.
            party = Party(name: name, startDate: startDate, address: address)
            persistance.saveParty(party: party!)
        }
    }
    
    func datePickerValueChanged(sender:UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.short
        
        dateFormatter.timeStyle = DateFormatter.Style.short
        
        startDateTextField.text = dateFormatter.string(from: sender.date)
    }
    
      // MARK: Actions
    
    @IBAction func startDatePicker(_ sender: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        
        datePickerView.datePickerMode = UIDatePickerMode.dateAndTime
        
        sender.inputView = datePickerView
        
        datePickerView.addTarget(self, action: #selector(AddPartyViewController.datePickerValueChanged), for: UIControlEvents.valueChanged)
    }
    
}
