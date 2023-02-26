//
//  AnnotationView.swift
//  Practica-iOS-Avanzado
//
//  Created by Eduardo Martinez Palomino on 21/2/23.
//

import MapKit

class AnnotationView: MKMarkerAnnotationView {
    override var annotation: MKAnnotation? {
        willSet { //es comprovación ANTES de que se complete la asignación de lo que se está intentando de pasar anotation.
            guard let value = newValue as? Annotation else { return }
            //canShowCallout = true //Comentamos para no definir siempre que coja la imagen
            detailCalloutAccessoryView = Callout(annotation: value)
        }
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
    }
}
