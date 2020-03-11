//
//  ViewController.swift
//  FacebookFriendsDemo
//
//  Created by Gamze Güven on 8.03.2020.
//  Copyright © 2020 Gamze Güven. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    let realm = try! Realm()
   
    @IBOutlet var userNameText: UITextField!
    @IBOutlet var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //getJsonData()
    }
    
    func getJsonData () {
        
    //let user = TestUser()
           
        let username = userNameText.text
           
        let url = URL(string: "https://api.myjson.com/bins/\(username!))")
           let session = URLSession.shared
           let dataTask = session.dataTask(with: url!) { (data, response, error) in
               if (error != nil){
                   let alert = UIAlertController.init(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                   let okButton = UIAlertAction.init(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
                   alert.addAction(okButton)
                   self.present(alert, animated: true, completion: nil)
                   
               } else{
                   if (data != nil){
                   do{
                       //let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
                   
                       let jsonDecode = try JSONDecoder().decode([Post].self ,  from:data!)
                       
                       DispatchQueue.main.async {
                           for i in jsonDecode{
                               print(i.id)
                               print(i.name)
                               print(i.age)
                            
                           }
                       }
                       
                   } catch {
                       print("UserNotFound")
                       }
                   }
               }
           }
           
           dataTask.resume()
    }
    
    @IBAction func logInButton(_ sender: Any) {
        getJsonData()
    }
}
   
