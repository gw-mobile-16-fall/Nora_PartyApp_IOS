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
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var startDateLabelView: UILabel!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var party: Party?
    let persistance = Persistance()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field’s user input through delegate callbacks.
        nameTextField.delegate = self
             }



    // MARK: Navigation
    //Cancel the AddPartyView when clicked

    @IBAction func cancelButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    // This method lets you configure a view controller before it's presented.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (saveButton === sender as AnyObject)  {

            let id = UUID().uuidString
            let name = nameTextField.text ?? ""
            let startDate = datePicker.date
            let address = addressTextField.text ?? ""
            

            // Set the party to be passed to PartyTabelViewContoller after the unwind segue.
            
            party = Party(id: id, name: name, startDate: startDate, address: address)
            //persistance.saveParty(party: party!)
        }
    }
    

    
      // MARK: Actions
    //When the datepicker value changed, show the choosen date on the label
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.short
        
        dateFormatter.timeStyle = DateFormatter.Style.short
        
        startDateLabelView.text = dateFormatter.string(from: sender.date)
    }
    

    
    //To handel empty text fields of Name and Address
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "unwindtoPartyTable" {
            if (nameTextField.text?.isEmpty)! || (addressTextField.text?.isEmpty)! {
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
