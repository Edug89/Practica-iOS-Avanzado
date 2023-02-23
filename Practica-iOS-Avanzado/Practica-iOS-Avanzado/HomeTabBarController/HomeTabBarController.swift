
//  HomeTabBarController.swift
//  Practica-iOS-Avanzado
//
//  Created by Eduardo Martinez Palomino on 19/2/23.


import Foundation
import UIKit

class HomeTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout() //para setear colores
        setupTabs() //para setear el controlador en este caso el TableViewController
        
    }
    private func setupTabs() {
        let navigationController1 = UINavigationController(rootViewController: HeroesListViewController()) ///Instanciamos la clase, y le indicamos que cargue el HeroesListViewController
        let tabImage = UIImage(systemName: "text.justify")!
        navigationController1.tabBarItem = UITabBarItem(title: "ListadoHeroes", image: tabImage, tag: 0)
        
        let navigationController2 = UINavigationController(rootViewController: MapViewController())
        let tabImg = UIImage(systemName: "square.grid.3x3.topleft.filled")!
               navigationController2.tabBarItem = UITabBarItem(title: "MapaHeroes", image: tabImg, tag: 1)
        
        viewControllers = [navigationController1,navigationController2]
        
        }
        
    private func setupLayout() {
            tabBar.backgroundColor = .systemBackground // le indicamos el color
        }
}

