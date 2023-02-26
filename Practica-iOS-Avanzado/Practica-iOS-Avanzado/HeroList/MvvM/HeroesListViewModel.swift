//
//  HeroListViewModel.swift
//  Practica-iOS-Avanzado
//
//  Created by Eduardo Martinez Palomino on 19/2/23.
//

import Foundation

class HeroesListViewModel: NSObject {
 
    override init() {
        
    }
    var updateUI: ((_ heroes: [HeroModel])-> Void)?
    
    func getData(){
        
        let apiClient = ApiClient(token: readDataKeychain(getEmail()))
        apiClient.getHeroes { [ weak self ] heroes, error in
            self?.updateUI?(heroes)
           
        }
      
    }
    
}
