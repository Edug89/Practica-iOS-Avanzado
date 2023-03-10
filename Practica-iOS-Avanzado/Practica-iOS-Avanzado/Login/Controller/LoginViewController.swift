//
//  LoginViewController.swift
//  Practica-iOS-Avanzado
//
//  Created by Eduardo Martinez Palomino on 15/2/23.
//

import UIKit

protocol LoginDelegate {
    func dismiss()
}

class LoginViewController: UIViewController {
    
    var mainView: LoginView {self.view as! LoginView}
    
    
    var loginButton : UIButton?
    var emailTextfield : UITextField?
    var passwordTextfield : UITextField?
    var errorMessageView: UILabel?
    
    var viewModel: LoginViewModel?
    
    var delegate: LoginDelegate?
    
    init(delegate: LoginDelegate) {
        super.init(nibName: nil, bundle: nil)
        self.delegate = delegate
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
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
        
        loginButton?.addTarget(self, action: #selector(didLoginTapped), for: .touchUpInside)
        
#if DEBUG
        
        emailTextfield?.text = "edugproduce@gmail.com"
        passwordTextfield?.text = "200789"
        
#endif
    }
    
    @objc
    func didLoginTapped(sender: UIButton) {
        guard let email = emailTextfield?.text, let password = passwordTextfield?.text else { //Una vez pulsamos el botón de acceder,comprueba el token que no está vacío y navegamos al HomeTabBarController
            return
        }
        
        viewModel?.updateUI = { [weak self] token, error in
            if readDataKeychain(email) == "" {
                saveDataKeychain(token, email) // Si leemos el kaychain y está vacío guardamos token y email
                saveEmail(email)
                
                // Prepare the info to notification
                let loginResponse = ["miData": ["token": token]]
                // Send a notification
                NotificationCenter.default.post(name: NSNotification.Name("notification.login.result"),
                                                object: nil,
                                                userInfo: loginResponse)
                return
            }
            
            if !error.isEmpty {
                DispatchQueue.main.async {
                    self?.errorMessageView?.text = error
                }
                deleteTokenKeychain(email)
            }
        }
        
        // Call view model to perform the login call with the apiClient
        viewModel?.login(email: email, password: password)
    }
    
    }
    private func loginAndSaveTokenInKeychain(){
}



