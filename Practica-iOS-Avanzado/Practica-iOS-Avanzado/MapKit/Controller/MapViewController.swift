//
//  Mapkit.swift
//  Practica-iOS-Avanzado
//
//  Created by Eduardo Martinez Palomino on 21/2/23.
//

import Foundation
import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    
    var location: [Hero] = []
    
    var mainView: MapView { self.view as! MapView }

    var locationManager = CLLocationManager()
    var annotations = [MKAnnotation]()
    
    override func loadView(){
        view = MapView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.delegate = self
                
        mainView.mapView.delegate = self
        mainView.mapView.showsUserLocation = true
        mainView.mapView.mapType = .standard
        
        getData()
        
    }
    
    private func getData() {
        self.location = getHeroesCoreData()
        self.createAnotation(location)
        
    }
    
    func createAnotation(_ location: [Hero]){
            mainView.mapView.register(AnnotationView.self,
                             forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)

            let annotations = location.map { Annotation(place: $0) }
            mainView.mapView.showAnnotations(annotations, animated: true)
        }
        
    }

    extension MapViewController: MKMapViewDelegate {
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            
            let id = MKMapViewDefaultAnnotationViewReuseIdentifier
            let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: id)
            
            if let annotation = annotation as? Annotation {
            
                annotationView?.canShowCallout = true
                annotationView?.detailCalloutAccessoryView = Callout(annotation: annotation)
                
                return annotationView
            }
            return nil
        }
       
        
    }


    // MARK: Extensions
extension MapViewController: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        if #available(iOS 14.0, *) {
            switch manager.authorizationStatus {
            case .notDetermined:
                debugPrint("Not determined")
            case .restricted:
                debugPrint("restricted")
            case .denied:
                debugPrint("denied")
            case .authorizedAlways:
                debugPrint("authorized always")
            case .authorizedWhenInUse:
                debugPrint("authorized when in use")
            @unknown default:
                debugPrint("Unknow status")
            }
        }
        
    }
    
    // iOS 13 y anteriores
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        switch manager.authorizationStatus {
        case .notDetermined:
            debugPrint("Not determined")
        case .restricted:
            debugPrint("restricted")
        case .denied:
            debugPrint("denied")
        case .authorizedAlways:
            debugPrint("authorized always")
        case .authorizedWhenInUse:
            debugPrint("authorized when in use")
        @unknown default:
            debugPrint("Unknow status")
        }
        
    }
}


