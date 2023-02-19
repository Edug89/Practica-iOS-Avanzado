//
//  HeroListViewController.swift
//  Practica-iOS-Avanzado
//
//  Created by Eduardo Martinez Palomino on 19/2/23.
//

import UIKit

class HeroesListViewController: UIViewController {
    
    var mainView: HeroListView {self.view as! HeroListView}
    var heroesList: [HeroModel] = []
    private var tableViewDataSource: HeroesListTableViewDataSource?
    private var tableVideDelegate: HeroesListTableViewDelegate?
    
    private var heroeListViewModel: HeroesListViewModel?
    private var loginViewModel = LoginViewModel()
    
    private var loginViewController: LoginViewController?
    private var loginViewControllerNotif: LoginViewControllerNotif?
    
    override func loadView() {
        view = HeroListView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableElements()
//        setDidTapOnCell()
        
        addNotification()
        
        // check if user is logged in
        if !isUserAuthenticated() {
            //            // Creo el LoginViewController
            //            loginViewController = LoginViewController(delegate: self)
            //
            //
            //            if let loginViewController  { //Es lo mismo que si pones = loginViewController 5,7
            //                loginViewController.modalPresentationStyle = .fullScreen
            //                //Aquí indicamos que ocupa toda la pantalla el login para que no puedan hacer scroll y quitarla
            //                self.navigationController?.present(loginViewController, animated: true)
            //            }
            //            return
            if let loginViewControllerNotif  { //Es lo mismo que si pones = loginViewController 5,7
                loginViewControllerNotif.modalPresentationStyle = .fullScreen
                self.navigationController?.present(loginViewControllerNotif, animated: true)
            }
            
            return
        }
        // get heroes data
        getData()
        
    }
    
    func addNotification() {
        // Comienzo a "escuchar" la notificación que me interesa(Se activa por así decirlo)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(loginResult(_:)),
                                               name: NSNotification.Name("notificacion.login.result"),
                                               object: nil)
    }
    
    func removeNotification() {
        NotificationCenter.default.removeObserver(self,
                                                  name: NSNotification.Name("notificacion.login.result"),
                                                  object: nil)
    }
    
    @objc
    func loginResult(_ notification: Notification) {
        debugPrint("haciendo algo al recibir la notificación")
        let result = notification.userInfo?["miData"] as? [String: Any]
        
        if let result {
            debugPrint("Notification result -> \(result)")
            
            if let token = result["token"] as? String, !token.isEmpty {
                // oculto el formulario de login
                DispatchQueue.main.async {
                    self.loginViewControllerNotif?.dismiss(animated: true)
                }
            }
        }
    }
    
    private func setTableElements() {
        tableVideDelegate = HeroesListTableViewDelegate()
        tableViewDataSource = HeroesListTableViewDataSource(tableView: mainView.heroesTableView)
        mainView.heroesTableView.dataSource = tableViewDataSource
        mainView.heroesTableView.delegate = tableVideDelegate
    }
    
    private func getData() {
        
        // Nos preparamos para capturar los datos devueltos por el api rest
        heroeListViewModel?.updateUI = { [weak self] heroes in
            self?.heroesList = heroes
            self?.tableViewDataSource?.set(heroes: heroes)
        }
        
        // Ejecutamos la llamada al api rest
        heroeListViewModel?.getData()
        
    }
    
//    private func setDidTapOnCell() {
//        tableVideDelegate?.didTapOnCell = { [weak self] index in
//            guard let datasource = self?.tableViewDataSource else { return }
//
//            let heroModel = datasource.heroes[index]
//
//            let heroDetailViewController = HeroDetailViewController(heroModel: heroModel)
//
//            // Presentamos el nuevo view controller
//            self?.present(heroDetailViewController, animated: true)
//        }
//    }
}
    
extension HeroesListViewController: LoginDelegate {
    func dismiss() {
        debugPrint("dismiss en login view controller")
        DispatchQueue.main.async {
            self.loginViewController?.dismiss(animated: true)
            //En esta func indicamos que cierre el Login
        }
    }
}
