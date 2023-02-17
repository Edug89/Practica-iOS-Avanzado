//
//  Globals.swift
//  Practica-iOS-Avanzado
//
//  Created by Eduardo Martinez Palomino on 17/2/23.
//

import Foundation

var authToken: String = ""
var apiClient: ApiClient?

func isUserAuthenticated() -> Bool {
    return !authToken.isEmpty
}
