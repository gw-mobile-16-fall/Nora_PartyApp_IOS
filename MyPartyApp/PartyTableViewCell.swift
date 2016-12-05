//
//  PartyTableViewCell.swift
//  MyPartyApp
//
//  Created by Nora Alhelal on 11/19/16.
//  Copyright © 2016 gwu. All rights reserved.
//

import UIKit

class PartyTableViewCell: UITableViewCell {
    
    //MARK: Properties

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   

}

