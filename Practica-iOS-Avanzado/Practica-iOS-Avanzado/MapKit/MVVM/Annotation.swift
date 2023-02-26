//
//  Annotation.swift
//  Practica-iOS-Avanzado
//
//  Created by Eduardo Martinez Palomino on 21/2/23.
//

import UIKit
import MapKit

class Annotation: NSObject, MKAnnotation {
    
    let coordinate: CLLocationCoordinate2D
    let name: String?
    let photo: String?
    
    init(place: Hero) {
        coordinate = CLLocationCoordinate2D(latitude: Double(place.latitud!)!, longitude: Double(place.longitud!)!)
        
        name = place.name
        photo = place.photo
    }
    
}




