//
//  HeroListViewModel.swift
//  Practica-iOS-Avanzado
//
//  Created by Eduardo Martinez Palomino on 19/2/23.
//

import Foundation

class HeroesListViewModel: NSObject {
    private var apiClient: ApiClient?
    
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    var updateUI: ((_ heroesList: [HeroModel]) -> Void)?
    
    func getData() {
        guard let apiClient = self.apiClient else { return  }
        
        apiClient.getHeroes { [weak self] heroes, error in
            self?.updateUI?(heroes)
        }
    }
}
