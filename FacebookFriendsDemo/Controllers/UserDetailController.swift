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
    public var userFriend: Post?

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = userFriend?.name
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
