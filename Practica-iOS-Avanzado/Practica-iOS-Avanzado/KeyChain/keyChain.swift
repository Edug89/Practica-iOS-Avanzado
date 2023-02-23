//
//  keyChain.swift
//  Practica-iOS-Avanzado
//
//  Created by Eduardo Martinez Palomino on 19/2/23.
//

import UIKit
import Security

class KeyChainManager {

    
    func deleteData(key: String) {
        // Preparamos la consulta
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            ]
        if (SecItemDelete(query as CFDictionary)) == noErr {
            debugPrint("Información del usuario borrada con éxito")
        } else {
            debugPrint("Se produjo un error a la hora de borrar")
        }
        
    }
    
    
    func updateData(key: String, value: String) {
 
        // Preparamos la consulta
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
        ]
        
        //Atribunos necesarios para actualizar
        let attributes: [String: Any] = [
            kSecValueData as String: value.data(using: .utf8)!
        ]
        
        if (SecItemUpdate(query as CFDictionary, attributes as CFDictionary)) == noErr {
            debugPrint("Información del usuario actualizada con éxito")
        } else {
            debugPrint("Se produjo un error a la hora de actualizar")
        }
    }
    
    //Establecer el susuario que queremos encontrar
    func readData(user: String) {
        
        
        // Preparamos la consulta
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: user,
            kSecMatchLimit as String: kSecMatchLimitOne,
            kSecReturnAttributes as String: true,
            kSecReturnData as String: true
        ]
        
        var item: CFTypeRef?
        
        if SecItemCopyMatching(query as CFDictionary, &item) == noErr {
            //extraemos la información
            
            if let existingItem = item as? [String: Any],
                let username = existingItem[kSecAttrAccount as String] as? String,
                let passwordData = existingItem[kSecValueData as String] as? Data, //El password lo pasamos de utf8 a DATA
                let password = String(data: passwordData, encoding: .utf8) { //Aquí descodificamos data
                
                debugPrint("La info es \(username) - \(password)")
            }
            
            
        } else {
            debugPrint("Se produjo un erro al consultar la información del usuario")
        }
        
    }
    
    //Función para guardar
    func saveData() {
        
        // definimos un usuario
        let username = "peter"
        let password = "12345".data(using: .utf8)!
        
        //preparamos los atributos necesarios(Lo guardamos como un diccionario nombre+valor)
        let attributes: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: username,
            kSecValueData as String: password
            
        ]
        
        //guardar el usuario
        if SecItemAdd(attributes as CFDictionary, nil) == noErr {
            debugPrint("Información del usuario guardada con éxito")
        } else {
            debugPrint("Se produjo un errror al guardar la información del ususario")
        }
        
        
    }

}

