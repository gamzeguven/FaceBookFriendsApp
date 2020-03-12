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
    @objc dynamic var userName: String? = ""
    @objc dynamic var id: String
    @objc dynamic var name: String
    @objc dynamic var age: Int
    @objc dynamic var about: String
    @objc dynamic var email: String
}

