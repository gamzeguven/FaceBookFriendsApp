//
//  Response.swift
//  FacebookFriendsDemo
//
//  Created by Gamze Güven on 10.03.2020.
//  Copyright © 2020 Gamze Güven. All rights reserved.
//

import Foundation
import RealmSwift

class Post: Decodable {
    let id: String
    let name: String
    let age: Int
}
class Items : Decodable {
    let id: String
}

//
//class TestUser: Object {
//
//    dynamic var username : String = "9nd54"
//}


