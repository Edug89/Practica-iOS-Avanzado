//
//  Mapkit.swift
//  Practica-iOS-Avanzado
//
//  Created by Eduardo Martinez Palomino on 21/2/23.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate{
    
    var mapView: MKMapView!
    
    override func loadView(){
        view = MapView()
    }
    
    var locationManager: CLLocationManager?
    
    var countries = [
        MapModel(name: "España", latitude: 39.3260685, longitude: -4.8379791, image: "https://photo980x880.mnstatic.com/37f93c7924cb320de906a1f1b9f4e12a/la-gran-via-de-madrid-1072541.jpg"),
        MapModel(name: "Francia", latitude: 46.603354, longitude: 1.8883335, image:
                    "https://queverenelmundo.com/guias/wp-content/uploads/pexels-rosivan-morais-6053202.jpg"),
        MapModel(name: "Italia", latitude: 42.6384261, longitude: 12.674297, image:
                    "https://premiumincoming.com/wp-content/uploads/2018/07/viajar-italia.jpg"),
        MapModel(name: "Alemania", latitude: 51.1638175, longitude: 10.4478313, image: "https://images.mnstatic.com/80/7b/807bafdaeed88061afc72505c7eb173f.jpg?quality=75&format=pjpg&fit=crop&width=980&height=880&aspect_ratio=980%3A880"),
        MapModel(name: "Suiza", latitude: 46.7985624, longitude: 8.2319736, image:
                    "https://cdn.britannica.com/65/162465-050-9CDA9BC9/Alps-Switzerland.jpg"),
        MapModel(name: "Croacia", latitude: 45.5643442, longitude: 17.0118954, image: "https://statics.es.tui.com/staticFiles2/croacia-a-su-aire-new-box230e278ab2db485a86ec484fc3886a77.jpg")
    ]
    
    
    //Europe
    let initialLalitude = 51.0
    let initialLongitude = 10.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
//        locationManager = CLLocationManager() //Instanciamos la clase
//        locationManager?.requestWhenInUseAuthorization() //Aquí pasamos un mensaje de autorización para permitir la ubicación, en la aplicación.
//        locationManager?.delegate = self
//
//        mapView.delegate = self
//
//        mapView.showsUserLocation = true //Es para mostrar en el mapa la ubicación
//        mapView.mapType = .standard //tipo de imagen en el mapa
//
//        moveToCoordinates(initialLalitude,initialLongitude)//Cogemos los valores

        
