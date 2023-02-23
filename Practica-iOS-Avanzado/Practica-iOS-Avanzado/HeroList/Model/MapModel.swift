//
//  Place.swift
//  Practica-iOS-Avanzado
//
//  Created by Eduardo Martinez Palomino on 21/2/23.
//

import Foundation

struct MapModel: Decodable {
    let name: String
    let latitude: Double
    let longitude: Double
    let image: String
}
