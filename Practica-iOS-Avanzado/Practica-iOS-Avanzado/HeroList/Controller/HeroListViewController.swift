//
//  HeroListViewController.swift
//  Practica-iOS-Avanzado
//
//  Created by Eduardo Martinez Palomino on 19/2/23.
//

import UIKit


class HeroesListViewController: UIViewController {
    
    var mainView: HeroeListView {self.view as! HeroeListView}
    var heroesListCoreDataFiltered: [Hero] = []
    var heroesList: [HeroModel] = []

    private var tableViewDataSource: HeroesListTableViewDataSource?
    private var tableVideDelegate: HeroesListTableViewDelegate?
    
    private var heroeListViewModel = HeroesListViewModel()
    private var mapViewModel = HeroesMapViewModel()
    private var loginViewModel = LoginViewModel()
    
    private var loginViewController: LoginViewController?
    
    var logoutButton : UIButton?

    
    
    override func loadView() {
        view = HeroeListView()
        
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        //createRefreshControll()

        let gestureTap = UITapGestureRecognizer(target: self, action: #selector(logout(_:)))
        mainView.logoutButton.addGestureRecognizer(gestureTap)
        
        mainView.logoutButton.addTarget(self, action: #selector(deleteCoreData), for: .touchUpInside)
        
        setTableElements()
//        setDidTapOnCell()
//        addNotification()
        
        // Check if user is logged in
        if readDataKeychain(getEmail()) == "" {
            
            presentLoginViewController()
            return
        }
        
//        getFullHeroeApiClient()

        
    }
    
    
    
    func presentLoginViewController() {
        // Creo el login view controller
        loginViewController = LoginViewController(coder: NSCoder())
        
        // show the login view controller
        if let loginViewController { // swift 5.7
            loginViewController.modalPresentationStyle = .fullScreen
            self.navigationController?.present(loginViewController, animated: true)
        }
    }
    
    
    
    
    func setTableElements(){
        tableVideDelegate = HeroesListTableViewDelegate()
        tableViewDataSource = HeroesListTableViewDataSource(tableView: mainView.heroesTableView)
        //mainView.searchBar.delegate = self
        mainView.heroesTableView.dataSource = tableViewDataSource
        mainView.heroesTableView.delegate = tableVideDelegate
    }
    
    private func setDidTapOnCell() {
                    tableVideDelegate?.didTapOnCell = { [weak self] index in
                        guard let datasource = self?.tableViewDataSource else { return }

                        _ = datasource.heroes[index]

                        let heroDetailViewController = HeroDetailViewController(heroModel: Hero())

                        // Presentamos el nuevo view controller
                        self?.present(heroDetailViewController, animated: true)
                    }
        }
    

    
    @objc
    func logout(_ gestureTap: UITapGestureRecognizer) {
        deleteTokenKeychain(getEmail())
        presentLoginViewController()
        
        
    }
    
    @objc
    func deleteCoreData(){
        deleteHeroesCoreData()
        DispatchQueue.main.async {
            self.mainView.heroesTableView.reloadData()
        }

    }
    
    
}


