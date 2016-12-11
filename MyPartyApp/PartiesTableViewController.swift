//
//  PartiesTableViewController.swift
//  MyPartyApp
//
//  Created by Nora Alhelal on 11/18/16.
//  Copyright © 2016 gwu. All rights reserved.
//

import UIKit

class PartiesTableViewController: UITableViewController
{
    
    //MARK: Properties
    
   var parties = [Party]()
   let persistance = Persistance()
    // Table view cells are reused and should be dequeued using a cell identifier.
   let cellIdentifier = "PartyCell"
   var addressToPass: String!

    override func viewDidLoad() {
        super.viewDidLoad()
 
        _ = persistance.fetchParties() //ask proffesor what is best place
 
        tableView.reloadData()
        
    }
 

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        
        // Fetches the appropriate party for the data source layout.
        let party = parties[indexPath.row]
     
        cell.nameLabel.text = party.name
        cell.dateLabel.text = party.startDate
        cell.addressLabel.text = party.address

        return cell
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
   
        if editingStyle == .delete {
            // Delete the row from the data source
            parties.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
           // tableView.reloadData()
 
        }    
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showLocationSegue" {
            let indexPath = tableView.indexPathForSelectedRow!
            let cell = tableView.cellForRow(at: indexPath)! as! PartyTableViewCell
            
            addressToPass = cell.addressLabel.text!
            let navigationController = segue.destination as! UINavigationController
            let mapViewController = navigationController.topViewController as! MapViewController
            
            mapViewController.passedAddress = addressToPass
            print("You prepare address #\(mapViewController.passedAddress)!")

        }
        else if segue.identifier == "addPartySegue" {
        }
        
    }
    
    
    @IBAction func unwindtoPartyTable(_ sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? AddPartyViewController, let party = sourceViewController.party {
            let newIndexPath = IndexPath(row: parties.count, section: 0)
            parties.append(party)
            tableView.insertRows(at: [newIndexPath], with: .bottom)
            persistance.saveParty(party: party)
        }
    }

}
