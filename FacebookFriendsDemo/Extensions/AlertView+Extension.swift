//
//  AlertView+Extension.swift
//  FacebookFriendsDemo
//
//  Created by Gamze Güven on 13.03.2020.
//  Copyright © 2020 Gamze Güven. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(alertText : String, alertMessage : String) {
        let alert = UIAlertController(title: alertText, message: alertMessage, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
