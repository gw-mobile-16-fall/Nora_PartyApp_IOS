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
    let nameKey = "name"
    let dateKey = "date"
    let addressKey = "address"
    
    func saveParty(party: Party) {
        let userDefaults = UserDefaults.standard
        
        var parties = fetchParties()
        parties.append(party)
        
        let data = NSKeyedArchiver.archivedData(withRootObject: parties)
        userDefaults.set(data, forKey: nameKey)
        userDefaults.set(data, forKey: dateKey)
        userDefaults.set(data, forKey: addressKey)
        userDefaults.synchronize()
    }
    
    func fetchParties() -> [Party] {
        let userDefaults = UserDefaults.standard
        let parties = userDefaults.object(forKey: nameKey) as? Data
        
        if let parties = parties {
            return NSKeyedUnarchiver.unarchiveObject(with: parties) as! [Party]
        }
        else{
            return [Party]()
        }
    }
    
     
    
}
