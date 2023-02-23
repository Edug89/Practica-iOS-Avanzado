//
//  CustomMarker.swift
//  Practica-iOS-Avanzado
//
//  Created by Eduardo Martinez Palomino on 21/2/23.
//

//import UIKit
//import MapKit
//
//class CustomMarker: MKAnnotationView {
//    override var annotation: MKAnnotation? {
//        willSet {
//            let pinImage = UIImage(named: "marker-blue")
//            let size = CGSize(width: 40, height: 40)
//            UIGraphicsBeginImageContext(size)
//            pinImage!.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
//            let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
//            
//            //añadimos la imagen
//            self.image = resizedImage
//        }
//    }
//}
