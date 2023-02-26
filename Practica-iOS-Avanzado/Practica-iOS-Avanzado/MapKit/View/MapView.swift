//
//  Callout.swift
//  Practica-iOS-Avanzado
//
//  Created by Eduardo Martinez Palomino on 21/2/23.
//

import UIKit
import Kingfisher
import MapKit

class MapView: UIView {
    
    let mapView: MKMapView = {
        let map = MKMapView()
        
        map.overrideUserInterfaceStyle = .dark
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setMapContraints()
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    private func setMapContraints() {
        addSubview(mapView)
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: topAnchor),
            mapView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: trailingAnchor)
            
        ])
    }
    
}
        
