//
//  AppDelegate.swift
//  FacebookFriendsDemo
//
//  Created by Gamze Güven on 8.03.2020.
//  Copyright © 2020 Gamze Güven. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if let url = Realm.Configuration.defaultConfiguration.fileURL {
            print(url.absoluteString)
        }
        
        do {
            _ = try Realm()
        } catch {
            print("Error initialising new Realm, \(error)")
        }
        
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
}

