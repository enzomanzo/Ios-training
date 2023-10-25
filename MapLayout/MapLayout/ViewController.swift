//
//  ViewController.swift
//  MapLayout
//
//  Created by Enzo Manzo Carelli on 18/10/23.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 41.890251, longitude: 12.492373)
        mapView.addAnnotation(annotation)
        
        annotation.title = "O Coliseu"
        annotation.subtitle = "A Casa Dos Gladiadores"
        
        let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 300, longitudinalMeters: 300)
        mapView.setRegion(region, animated: true)
        
        // Do any additional setup after loading the view.
    }

    

}

