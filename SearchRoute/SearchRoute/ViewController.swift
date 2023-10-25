//
//  ViewController.swift
//  SearchRoute
//
//  Created by Enzo Manzo Carelli on 18/10/23.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var caixaEndereco: UITextField!
    @IBOutlet weak var mapa: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        mapa.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        // Do any additional setup after loading the view.
    }


    @IBAction func buscar(_ sender: Any) {
        localizarEndereco()
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let render = MKPolylineRenderer(overlay: overlay as! MKPolyline)
        render.strokeColor = .blue
        return render
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
    }
    
    
    func localizarEndereco(){
    let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(caixaEndereco.text!) { placemarks, error in
            guard let placemarks = placemarks, let location = placemarks.first?.location
            else {
                print("Nao encontrou o endereço")
                return
            }
            print(location)
            self.rota(destinationCord: location.coordinate)
        }
    }
    
    func rota(destinationCord: CLLocationCoordinate2D){
        let sourceCordinate = (locationManager.location?.coordinate)!
        
        let sourcePlacemark = MKPlacemark(coordinate: sourceCordinate)
        let destinationPlacemark = MKPlacemark(coordinate: destinationCord)
        
        let sourceItem = MKMapItem(placemark: sourcePlacemark)
        let destinationItem = MKMapItem(placemark: destinationPlacemark)
        
        let destinationRequest = MKDirections.Request()
        destinationRequest.source = sourceItem
        destinationRequest.destination = destinationItem
        destinationRequest.transportType = .automobile
        destinationRequest.requestsAlternateRoutes = true
        
        let directions = MKDirections(request: destinationRequest)
        directions.calculate { response, error in
            guard let response = response else {
                if let error = error {
                    print("Alguma coisa deu errado \(error.localizedDescription)")
                }
                return
            }
            let route = response.routes[0]
            self.mapa.addOverlay(route.polyline)
            self.mapa.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
        }
        
        
    }
}

