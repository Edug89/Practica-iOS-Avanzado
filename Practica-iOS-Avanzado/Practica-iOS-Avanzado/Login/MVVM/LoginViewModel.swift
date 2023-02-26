//
//  LoginViewModel.swift
//  Practica-iOS-Avanzado
//
//  Created by Eduardo Martinez Palomino on 17/2/23.
//

import Foundation


class LoginViewModel: NSObject {

    var updateUI: ((_ token: String, _ error: String) -> Void)?
    
    func login(email: String, password: String) {

        ApiClient.shared.login(user: email, password: password) { [weak self] token, error in
            debugPrint(token ?? "")
            debugPrint(error ?? "")
            
            if let token = token {
                self?.updateUI?(token, "")
                return
            }

            if let error = error {
                self?.updateUI?("", error.localizedDescription)
                return
            }

        }
    }
    
    
}
