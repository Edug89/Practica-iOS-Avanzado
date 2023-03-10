//
//  AppDelegate.swift
//  Practica-iOS-Avanzado
//
//  Created by Eduardo Martinez Palomino on 15/2/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    lazy var coreDataUsers: CoreDataManager = .init(modelName: "User")
    lazy var coreDataHeroes: CoreDataManager = .init(modelName: "Heroe")

        
    static let sharedAppDelegate: AppDelegate = {
       
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Error during app delegate creation")
        }
        
        return delegate
        
    }()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }


    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

