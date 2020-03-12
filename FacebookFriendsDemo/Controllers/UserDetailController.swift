//
//  UserDetailController.swift
//  FacebookFriendsDemo
//
//  Created by Gamze Güven on 12.03.2020.
//  Copyright © 2020 Gamze Güven. All rights reserved.
//

import UIKit

class UserDetailController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet weak var aboutLabel: UILabel!
    
    public var userFriend: Post?

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = userFriend?.name
        aboutLabel.text = userFriend?.about
        // Do any additional setup after loading the view.
    }
}
