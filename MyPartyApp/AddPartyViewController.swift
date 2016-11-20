//
//  AddPartyViewController.swift
//  MyPartyApp
//
//  Created by Nora Alhelal on 11/18/16.
//  Copyright © 2016 gwu. All rights reserved.
//

import UIKit

class AddPartyViewController: UIViewController {
    
    // MARK: Properties
      //Set up connections with the text fields in the story board
    @IBOutlet weak var addNameLabel: UITextField!
    @IBOutlet weak var addDateLabel: UITextField!
    @IBOutlet weak var addAddressLabel: UITextField!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    var party: Party?
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: Navigation
    // This method lets you configure a view controller before it's presented.
    override func prepare(for segue: UIStoryboardSegue, sender:Any?){
        if let barButton = sender as? UIBarButtonItem {
            if saveButton == barButton {
                let name = addNameLabel.text ?? ""
                let date = addDateLabel.text ?? ""
                let address = addAddressLabel.text ?? ""
                
                // Set the party to be passed to PartyTabelViewContoller after the unwind segue.
                party = Party(name: name, date: date, address: address)
            }
        }
    }
 
  
    
    // MARK: Actions
    
    
}
