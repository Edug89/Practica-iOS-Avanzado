//
//  keyChain.swift
//  Practica-iOS-Avanzado
//
//  Created by Eduardo Martinez Palomino on 19/2/23.
//

import Foundation
import Security

struct AuthInfo {
    let service: String
    let account: String
    let token: String
}


func saveAuthInfo(_ authInfo: AuthInfo) -> Bool {
    // Crea un diccionario que describe la información de autenticación
    let query: [String: Any] = [
        kSecClass as String: kSecClassGenericPassword,
        kSecAttrService as String: authInfo.service,
        kSecAttrAccount as String: authInfo.account,
        kSecValueData as String: authInfo.token.data(using: .utf8)!
    ]
    
    // Guarda la información en el Keychain
    let status = SecItemAdd(query as CFDictionary, nil)
    return status == errSecSuccess
}


func loadAuthInfo(service: String, account: String) -> AuthInfo? {
    // Crea un diccionario que describe la información de autenticación que se desea recuperar
    let query: [String: Any] = [
        kSecClass as String: kSecClassGenericPassword,
        kSecAttrService as String: service,
        kSecAttrAccount as String: account,
        kSecReturnData as String: kCFBooleanTrue!,
        kSecMatchLimit as String: kSecMatchLimitOne
    ]
    
    // Recupera la información del Keychain
    var item: CFTypeRef?
    let status = SecItemCopyMatching(query as CFDictionary, &item)
    
    if status == errSecSuccess, let data = item as? Data, let token = String(data: data, encoding: .utf8) {
        return AuthInfo(service: service, account: account, token: token)
    } else {
        return nil
    }
}
