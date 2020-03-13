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
    
    func save(dataUser: Post) {
        do {
            try realm.write {
                realm.add(dataUser)
                print(dataUser.name + " added local")
            }
        } catch {
            print("Error saving post \(error)")
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
            print("Error")
        }
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if let err = error {
                self.showAlert(alertText: "Warning", alertMessage: "Unable to respond transaction.")
            } else {
                if data != nil {
                    do{
                        let postArray = try JSONDecoder().decode([Post].self ,  from:data!)
                        DispatchQueue.main.async {
                            for post in postArray {
                                post.userName = self.userNameText.text ?? ""
                                self.save(dataUser: post)
                            }
                            complationHandler(postArray)
                        }
                    } catch {
                        print("user not found")
                    }
                }
            }
        }
        
        dataTask.resume()
    }
    
    @IBAction func logInButton(_ sender: Any) {
        if (userNameText.text != "" && passwordText.text != "") {
            getJsonData { [weak self] (posts) in
                if let controller = UserViewController.getController(storyBoardName: "Main", controllerIdentifier: "userList") as? UserViewController {
                    controller.userFriendArray = posts
                    self?.navigationController?.pushViewController(controller, animated: true)
                }
            }
        } else {
            self.showAlert(alertText: "Warning", alertMessage: "Please type all fields.")
        }
    }
}
