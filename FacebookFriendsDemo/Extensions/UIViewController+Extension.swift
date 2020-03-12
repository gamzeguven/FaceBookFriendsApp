//
//  TableViewCell.swift
//  FacebookFriendsDemo
//
//  Created by Gamze Güven on 12.03.2020.
//  Copyright © 2020 Gamze Güven. All rights reserved.
//

import UIKit

extension UIViewController {
    class func getController(storyBoardName: String, controllerIdentifier: String) -> UIViewController {
        let storyboard = UIStoryboard(name: storyBoardName, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: controllerIdentifier)
        return controller
    }
}
