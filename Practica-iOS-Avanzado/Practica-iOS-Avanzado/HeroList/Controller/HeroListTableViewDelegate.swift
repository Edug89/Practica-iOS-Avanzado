//
//  HeroListTableViewDelegate.swift
//  Practica-iOS-Avanzado
//
//  Created by Eduardo Martinez Palomino on 19/2/23.
//

import Foundation
import UIKit

class HeroesListTableViewDelegate: NSObject, UITableViewDelegate {
    
    var didTapOnCell: ((Int) -> Void)?
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didTapOnCell?(indexPath.row)
    }
    
}
