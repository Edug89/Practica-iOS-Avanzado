//
//  HeroModel.swift
//  Practica-iOS-Avanzado
//
//  Created by Eduardo Martinez Palomino on 17/2/23.
//

import Foundation

struct HeroModel: Decodable {
  let photo: String
  let id: String
  let favorite: Bool
  let name: String
  let description: String
}
