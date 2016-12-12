//
//  PartiesTableViewController.swift
//  MyPartyApp
//
//  Created by Nora Alhelal on 11/18/16.
//  Copyright © 2016 gwu. All rights reserved.
//

import UIKit

class PartiesTableViewController: UITableViewController {
    
    //MARK: Properties
   var parties = [Party]()
   let persistance = Persistance()
    // For table view cells to be dequeued using a cell identifier.
   let cellIdentifier = "PartyCell"
    //The address String to be sent to MapView
   var addressToPass: String!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
 
        tableView.delegate = self
       tableView.reloadData()
        
    }
 

    

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parties.count
    }

   

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Because I used customized cells
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
            as! PartyTableViewCell
        
        // Fetches the party for the cell.
        let party = parties[indexPath.row]
        
        cell.nameLabel.text = party.name
        cell.addressLabel.text = party.address
       
        //fetch the date and format it using DateFormatter
        let datetoConvert = party.startDate
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd 'at' h:mm a"
        cell.dateLabel.text = dateFormatter.string(from: datetoConvert)
 
  
        return cell
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
   
        if editingStyle == .delete {
            // Delete the row from the data source
            parties.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
  
        }    
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        // Pass the selected object to the new view controller.
        //Beased on the segue destination
        if segue.identifier == "showLocationSegue" {
            // as I want the address string of the selected row to be passed to MapViewController
            let indexPath = tableView.indexPathForSelectedRow!
            let cell = tableView.cellForRow(at: indexPath)! as! PartyTableViewCell
            addressToPass = cell.addressLabel.text!
            //Becuase the MapViewController is embaded in UINavigationController
            let navigationController = segue.destination as! UINavigationController
            let mapViewController = navigationController.topViewController as! MapViewController
            //Pass the address string
            mapViewController.passedAddress = addressToPass

        }
        else if segue.identifier == "addPartySegue" {
            //do nothing
        }
        
    }
    
    
    @IBAction func unwindtoPartyTable(_ sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? AddPartyViewController, let party = sourceViewController.party {
            let newIndexPath = IndexPath(row: parties.count, section: 0)
            parties.append(party)
            tableView.insertRows(at: [newIndexPath], with: .bottom)
         
        }
    }

}
