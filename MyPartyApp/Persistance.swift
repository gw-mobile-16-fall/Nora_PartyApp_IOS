//
//  Persistance.swift
//  MyPartyApp
//
//  Created by Nora Alhelal on 11/23/16.
//  Copyright © 2016 gwu. All rights reserved.
//

import Foundation

class Persistance {
    
    //MARK: Types
    let partiesKey = "parties"
    
    func saveParty(party: Party) {
        let userDefaults = UserDefaults.standard
        
        var parties = fetchParties()
        parties.append(party)
        
        let data = NSKeyedArchiver.archivedData(withRootObject: parties)
        userDefaults.set(data, forKey: partiesKey)
        userDefaults.synchronize()
    }
    
    func fetchParties() -> [Party] {
        let userDefaults = UserDefaults.standard
        let parties = userDefaults.object(forKey: partiesKey) as? Data
        
        if let parties = parties {
            return NSKeyedUnarchiver.unarchiveObject(with: parties) as! [Party]
        }
        else{
            return [Party]()
        }
    }
    
//    func deleteParty() -> [Party] {
//        let userDefaults = UserDefaults.standard
//        let parties = userDefaults.object(forKey: partiesKey) as? Data
//        UserDefaults.removeObject(forKey: partiesKey)
//        parties.remove(at: indexPath.row)
//        tableView.deleteRows(at: [indexPath], with: .automatic)
//        
//    }
    
    
}
