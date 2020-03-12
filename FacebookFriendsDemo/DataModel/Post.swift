//
//  Response.swift
//  FacebookFriendsDemo
//
//  Created by Gamze Güven on 10.03.2020.
//  Copyright © 2020 Gamze Güven. All rights reserved.
//

import Foundation
import RealmSwift

class Post: Object, Codable {
    @objc dynamic var id: String
    @objc dynamic var name: String
    @objc dynamic var age: Int
    @objc dynamic var userName: String? = ""
    
}
//class Items : Codable {
//    let id: String
//}

//
//class TestUser: Object {
//
//    dynamic var username : String = "9nd54"
//}


