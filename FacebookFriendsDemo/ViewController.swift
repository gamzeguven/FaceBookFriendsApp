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
    }
    
    func save(category: Post) {
        let newCategory = Category()
        newCategory.id = category.id
        newCategory.name = category.name
        newCategory.age = category.age
        
        do {
            try realm.write {
                realm.add(newCategory)
                print(newCategory.name + " added local")
            }
        } catch {
            print("Error saving category \(error)")
        }
    }
    
    func getJsonData () {
                
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
                        //var newCategory = Category()
                        //var emptyCategory = Category()
                           for i in jsonDecode{
                               //newCategory.id = i.id
                               //newCategory.name = i.name
                               //newCategory.age = i.age
                               self.save(category: i)
                            //newCategory.id = emptyCategory.id
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
        self.performSegue(withIdentifier: "toFriendsVC", sender: nil)

    }
}
   
