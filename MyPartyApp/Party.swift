//
//  Party.swift
//  MyPartyApp
//
//  Created by Nora Alhelal on 11/20/16.
//  Copyright © 2016 gwu. All rights reserved.
//

import UIKit

class Party {
    
    // MARK: Properties
    var name: String
    var date:  String
    var address: String
    
    
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

}



