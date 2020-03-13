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
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var companyLabel: UILabel!
    @IBOutlet var emailLabelUser: UILabel!
    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var pictureUser: UIImageView!
    
    public var userFriend: Post?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        nameLabel.text = userFriend?.name
        aboutLabel.text = userFriend?.about
        ageLabel.text = "Age: \(userFriend?.age ?? 0)"
        companyLabel.text = "Company: \(userFriend?.company ?? "")"
        emailLabelUser.text = userFriend?.email
        phoneLabel.text = userFriend?.phone
        addressLabel.text = "Address: \(userFriend?.address ?? "")"
        let url = URL(string: userFriend!.picture)
        let data = try? Data(contentsOf: url!)
        pictureUser.image = UIImage(data: data!)
    }
}
