//
//  Party.swift
//  MyPartyApp
//
//  Created by Nora Alhelal on 11/20/16.
//  Copyright © 2016 gwu. All rights reserved.
//

import UIKit



class Party: NSObject, NSCoding {
//Use NSObject and NScoding for persistance data
 
 
    // MARK: Properties
    var id: String = UUID().uuidString
    var name: String
    var startDate: Date
    var address: String
    
    // Properties Keys
    let uuidKey = "uuid"
    let nameKey = "name"
    let startDateKey = "startDate"
    let addressKey = "address"
    
    // MARK: Initialization
    init?(id: String, name: String, startDate: Date, address: String) {
        
        // Initialize stored properties.
        self.id = id
        self.name = name
        self.startDate = startDate
        self.address = address
        
        super.init()
        

    }

    // MARK: NSCoding
    
    required init?(coder aDecoder: NSCoder) {

        id = aDecoder.decodeObject(forKey: uuidKey) as! String
        name = aDecoder.decodeObject(forKey: nameKey) as! String
        startDate = aDecoder.decodeObject(forKey: startDateKey) as! Date
        address = aDecoder.decodeObject(forKey: addressKey) as! String
     }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: uuidKey)
        aCoder.encode(name, forKey: nameKey)
        aCoder.encode(startDate, forKey: startDateKey)
        aCoder.encode(address, forKey: addressKey)
    }
    
}



