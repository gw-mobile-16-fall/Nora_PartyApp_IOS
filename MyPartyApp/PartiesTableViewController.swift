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


    override func viewDidLoad() {
        super.viewDidLoad()
        
      //   Load the sample data.
//        loadSampleParty()
        
        
    }
//    
//    func loadSampleParty () {
//     
//        let party1 = Party(name: "Caprese Salad", date: "oct", address: "1600 S Eads")!
//        
//        let party2 = Party(name: "Chicken Salad", date: "Nov", address: "5666 S Eads")!
//        
//        let party3 = Party(name: "Meat Salad", date: "Dec", address: "43672 S Eads")!
//        
//        
//        parties += [party1, party2, party3]
//    }

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
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "PartyCell"
        
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
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
 

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            parties.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
 

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func unwindtoPartyTable(_ sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? AddPartyViewController, let party = sourceViewController.party {
            let newIndexPath = IndexPath(row: parties.count, section: 0)
            parties.append(party)
            tableView.insertRows(at: [newIndexPath], with: .bottom)        }
    }

}
