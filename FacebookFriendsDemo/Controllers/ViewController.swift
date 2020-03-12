//
//  ViewController.swift
//  FacebookFriendsDemo
//
//  Created by Gamze Güven on 8.03.2020.
//  Copyright © 2020 Gamze Güven. All rights reserved.
//

import UIKit
import RealmSwift

typealias CompletionPostArrayHandler = (_ posts:[Post]?) -> Void


class ViewController: UIViewController {
    let realm = try! Realm()
    
    @IBOutlet var userNameText: UITextField!
    @IBOutlet var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func save(category: Post) {
        do {
            try realm.write {
                realm.add(category)
                print(category.name + " added local")
            }
        } catch {
            print("Error saving category \(error)")
        }
    }
    
    func getJsonData(complationHandler:@escaping CompletionPostArrayHandler) {
        
        let username = userNameText.text
        
        let url = URL(string: "https://api.myjson.com/bins/\(username!))")
        let session = URLSession.shared
        do{
            if let persons = try? Realm().objects(Post.self) {
                var array = Array(persons)
                array = array.filter({ $0.userName == userNameText.text })
                
                if array.count > 0 {
                    complationHandler(array)
                    return
                }
            }
        } catch {
            print("UserNotFound")
        }
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if (error != nil){
                
            } else{
                if (data != nil){
                    do{
                        //let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
                        
                        let postArray = try JSONDecoder().decode([Post].self ,  from:data!)
                        DispatchQueue.main.async {
                            for post in postArray {
                                post.userName = self.userNameText.text ?? ""
                                self.save(category: post)
                            }
                            complationHandler(postArray)
                            
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
        if (userNameText.text != "") {
            getJsonData { [weak self] (posts) in
                if let controller = UserViewController.getController(storyBoardName: "Main", controllerIdentifier: "userList") as? UserViewController {
                    controller.userFriendArray = posts
                    self?.navigationController?.pushViewController(controller, animated: true)
                }
                
            }
            
        }else{
            let alert = UIAlertController.init(title: "Error", message: "Kullanıcı adı boş olamaz.", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction.init(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
            
        }
    }
}

