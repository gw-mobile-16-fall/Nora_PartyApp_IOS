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
 
    
    
    // MARK: Properties
    var uuid: String = NSUUID().uuidString
    var name: String
    var startDate:  String
    var address: String
    
    let uuidKey = "uuid"
    let nameKey = "name"
    let startDateKey = "startDate"
    let addressKey = "address"
    
    // MARK: Initialization
    init?(name: String, startDate: String, address: String) {
        
        // Initialize stored properties.
        
        self.name = name
        self.startDate = startDate
        self.address = address
        
        super.init()
        
        // Initialization should fail if tone of the values is empty.
//        if name.isEmpty || date.isEmpty || address.isEmpty {
//            return nil
        //}
    }

    // MARK: NSCoding
    
    required init?(coder aDecoder: NSCoder) {
        uuid = aDecoder.decodeObject(forKey: uuidKey) as! String
        name = aDecoder.decodeObject(forKey: nameKey) as! String
        startDate = aDecoder.decodeObject(forKey: startDateKey) as! String
        address = aDecoder.decodeObject(forKey: addressKey) as! String
        
        //self.init(name: name, date: date, address: address)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(uuid, forKey: uuidKey)
        aCoder.encode(name, forKey: nameKey)
        aCoder.encode(startDate, forKey: startDateKey)
        aCoder.encode(address, forKey: addressKey)
    }
    

}



