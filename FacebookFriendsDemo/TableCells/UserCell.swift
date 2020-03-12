//
//  UserCell.swift
//  FacebookFriendsDemo
//
//  Created by Gamze Güven on 12.03.2020.
//  Copyright © 2020 Gamze Güven. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet var userFriendLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}
