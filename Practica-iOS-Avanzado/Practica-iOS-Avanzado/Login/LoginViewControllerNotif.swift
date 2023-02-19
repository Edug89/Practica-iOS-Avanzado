//
//  LoginViewControllerNotif.swift
//  Practica-iOS-Avanzado
//
//  Created by Eduardo Martinez Palomino on 18/2/23.
//

import Foundation
import UIKit

class LoginViewControllerNotif: UIViewController {
    var mainView: LoginView {self.view as! LoginView}
    
    var loginButton : UIButton?
    var emailTextfield : UITextField?
    var passwordTextfield : UITextField?
    var errorMessageView: UILabel?
    
    var viewModel: LoginViewModel?
    
    
    override func loadView() {
        let loginView = LoginView()
        
        loginButton = loginView.getLoginButtonView()
        emailTextfield = loginView.getEmailView()
        passwordTextfield = loginView.getPasswordView()
        errorMessageView = loginView.getErrorView()
        
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = LoginViewModel()
        
//        loginButton?.addTarget(self, action: #selector(didLoginTapped), for: .touchUpInside)
        
//        #if DEBUG
//
//        emailTextfield?.text = "pmg@test.com"
//        passwordTextfield?.text = "!Test1234"
//
//        #endif
    }
    
//    @objc
//    func didLoginTapped(sender: UIButton) {
//        guard let email = emailTextfield?.text, let password = passwordTextfield?.text else {
//            return
//        }
//
//        debugPrint("login for: \(email) - \(password)")
//
//        viewModel?.updateUI = { [weak self] token, error in
//            if !token.isEmpty {
//                authToken = token // almacenarlo globalmente
//
//
//
//                return
//            }
//
//            if !error.isEmpty {
//                DispatchQueue.main.async {
//                    self?.errorMessageView?.text = error
//                }
//                authToken = ""
//            }
//        }
//
//        // Call view model to perform the login call with the apiClient
//        viewModel?.login(email: email, password: password)
//    }
//
}


