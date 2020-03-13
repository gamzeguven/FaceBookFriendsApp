//
//  UserViewController.swift
//  FacebookFriendsDemo
//
//  Created by Gamze Güven on 12.03.2020.
//  Copyright © 2020 Gamze Güven. All rights reserved.
//

import UIKit
import RealmSwift

class UserViewController:  UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var userTable: UITableView!
    
    public var userFriendArray: [Post]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userTable.delegate = self
        userTable.dataSource = self
        let nib = UINib(nibName: "UserCell", bundle: nil)
        userTable.register(nib, forCellReuseIdentifier: "UserCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userFriendArray?.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let post = userFriendArray?[indexPath.row] {
            if let controller = UserDetailController.getController(storyBoardName: "Main", controllerIdentifier: "userDetail") as? UserDetailController {
                controller.userFriend = post
                navigationController?.pushViewController(controller, animated: true)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserCell {
            cell.userFriendLabel.text =  userFriendArray?[indexPath.row].name
            cell.emailLabel.text = userFriendArray?[indexPath.row].email
            return cell
        }
        return UITableViewCell()
    }
}
