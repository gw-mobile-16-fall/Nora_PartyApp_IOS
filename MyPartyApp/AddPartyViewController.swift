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
    @IBOutlet weak var addNameLabel: UITextField!
    @IBOutlet weak var addDateLabel: UITextField!
    @IBOutlet weak var addAddressLabel: UITextField!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    var party: Party?
    
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field’s user input through delegate callbacks.
        addNameLabel.delegate = self
        
        // Enable the Save button only if the text field has a valid Meal name.
        checkValidName()
    }
    
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        checkValidName()
        navigationItem.title = textField.text
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Disable the Save button while editing.
        saveButton.isEnabled = false
    }
    
    func checkValidName() {
        // Disable the Save button if the text field is empty.
        let text = addNameLabel.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }

    // MARK: Navigation
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    func datePickerValueChanged(sender:UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.short
        
        dateFormatter.timeStyle = DateFormatter.Style.short
        
        addDateLabel.text = dateFormatter.string(from: sender.date)
    }
    
    // This method lets you configure a view controller before it's presented.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (saveButton === sender as AnyObject)  {
            //     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            //        if let barButton = sender as? UIBarButtonItem {
            //            if saveButton === barButton {
            let name = addNameLabel.text ?? ""
            let date = addDateLabel.text ?? ""
            let address = addAddressLabel.text ?? ""
            
            // Set the party to be passed to PartyTabelViewContoller after the unwind segue.
            party = Party(name: name, date: date, address: address)
        }
    }
    
      // MARK: Actions
    
    @IBAction func startDatePicker(_ sender: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        
        datePickerView.datePickerMode = UIDatePickerMode.dateAndTime
        
        sender.inputView = datePickerView
        
        datePickerView.addTarget(self, action: #selector(AddPartyViewController.datePickerValueChanged), for: UIControlEvents.valueChanged)
    }
    
}
