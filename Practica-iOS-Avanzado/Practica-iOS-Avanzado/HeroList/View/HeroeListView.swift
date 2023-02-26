//
//  HeroListView.swift
//  Practica-iOS-Avanzado
//
//  Created by Eduardo Martinez Palomino on 19/2/23.
//

import Foundation
import UIKit

class HeroeListView: UIView {
    
    let headerLabel = {
        let label = UILabel()
//        label.text = "MVVM"
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let heroesTableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(HeroeListViewCell.self, forCellReuseIdentifier: "HeroeListViewCell")
        return tableView
    } ()
    
    let logoutButton = {
        let button = UIButton()
        button.setTitle("logout", for: .normal)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.backgroundColor = .blue
        button.layer.borderColor = UIColor.blue.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = .gray
        addSubview(headerLabel)
        addSubview(heroesTableView)
        addSubview(logoutButton)
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            headerLabel.heightAnchor.constraint(equalToConstant: 20),
            
            heroesTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            heroesTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            heroesTableView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 20),
            heroesTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            logoutButton.topAnchor.constraint(equalTo: headerLabel.topAnchor, constant: 40),
            logoutButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -6),
            logoutButton.widthAnchor.constraint(equalToConstant: 100),
            logoutButton.heightAnchor.constraint(equalToConstant: 40),
            
        ])
        
    }
    
    func getLougoutButton() -> UIButton {
        return logoutButton
    }
    
    
}
