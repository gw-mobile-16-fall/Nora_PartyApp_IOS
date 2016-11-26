//
//  Party.swift
//  MyPartyApp
//
//  Created by Nora Alhelal on 11/20/16.
//  Copyright © 2016 gwu. All rights reserved.
//

import UIKit



class Party: NSObject, NSCoding {
//Use NSObject and NScoding for persistance data resons 
    //LIKE the PushUps APP 
    
    
    
    // MARK: Properties
    var name: String
    var date:  String
    var address: String
    
    let nameKey = "name"
    let dateKey = "date"
    let addressKey = "address"
    
    // MARK: Initialization
    init?(name: String, date: String, address: String) {
        
        // Initialize stored properties.
        self.name = name
        self.date = date
        self.address = address
        
        // Initialization should fail if tone of the values is empty.
        if name.isEmpty || date.isEmpty || address.isEmpty {
            return nil
        }
    }

    // MARK: NSCoding
    
    required convenience init?(coder aDecoder: NSCoder) {
       let name = aDecoder.decodeObject(forKey: nameKey) as! String
       let date = aDecoder.decodeObject(forKey: dateKey) as! String
       let address = aDecoder.decodeObject(forKey: addressKey) as! String
        
        self.init(name: name, date: date, address: address)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: nameKey)
        aCoder.encode(date, forKey: dateKey)
        aCoder.encode(address, forKey: addressKey)
    }
    
    

    
}



