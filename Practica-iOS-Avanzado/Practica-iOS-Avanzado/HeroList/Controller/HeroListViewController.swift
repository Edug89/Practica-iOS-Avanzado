//
//  HeroListViewController.swift
//  Practica-iOS-Avanzado
//
//  Created by Eduardo Martinez Palomino on 19/2/23.
//

import UIKit

class HeroesListViewController: UIViewController {
    
    var mainView: HeroeListView {self.view as! HeroeListView}
    
    var heroesList: [HeroModel] = []

    private var tableViewDataSource: HeroesListTableViewDataSource?
    private var tableVideDelegate: HeroesListTableViewDelegate?
    
    private var heroeListViewModel: HeroesListViewModel?
    private var loginViewModel = LoginViewModel()
    
    private var loginViewController: LoginViewController?

    
    override func loadView() {
        view = HeroeListView()
        setTableElements()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        heroeListViewModel = HeroesListViewModel(apiClient: ApiClient.shared)
        getData()
//        setDidTapOnCell()
        
        // check if user is logged in
        if !isUserAuthenticated() {
            
            loginViewController = LoginViewController(delegate: self) // Creo el LoginViewController
            if let loginViewController  { //Es lo mismo que si pones = loginViewController 5,7
                loginViewController.modalPresentationStyle = .fullScreen //Aquí indicamos que ocupa toda la pantalla del login,y no puedan quitarla.
                self.navigationController?.present(loginViewController, animated: true)
            }
            return
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
            self.getData()
        }
    }
    
}
