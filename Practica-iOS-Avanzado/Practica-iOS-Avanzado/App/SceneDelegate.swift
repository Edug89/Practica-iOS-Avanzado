//
//  SceneDelegate.swift
//  Practica-iOS-Avanzado
//
//  Created by Eduardo Martinez Palomino on 15/2/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window?.windowScene = windowScene
        window?.rootViewController = HomeTabBarController()
        
        window?.makeKeyAndVisible()
    }



}

