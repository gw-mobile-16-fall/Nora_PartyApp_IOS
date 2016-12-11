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
     }
//    override func viewWillDisappear(_ animated: Bool) {
//        <#code#>
//    }
    


    
    

    // MARK: Navigation

    @IBAction func cancel(_ sender: Any) {
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
            //persistance.saveParty(party: party!)
        }
    }
    
    func datePickerValueSelected(sender:UIDatePicker) {
        
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
        
        datePickerView.addTarget(self, action: #selector(AddPartyViewController.datePickerValueSelected), for: UIControlEvents.valueChanged)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "unwindtoPartyTable" {
            if (nameTextField.text?.isEmpty)! || (startDateTextField.text?.isEmpty)! || (addressTextField.text?.isEmpty)! {
                let alert = UIAlertController(title: "Missing Information", message: "Please Enter all Party Details", preferredStyle: .alert )
                
                let OKAction = UIAlertAction(title: "OK", style: .default)
                alert.addAction(OKAction)
                
                self.present(alert, animated: true)
            
                return false
            }
        }else {
            return true
        }
        return true
    }
}
