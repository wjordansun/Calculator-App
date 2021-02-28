//
//  SecondViewController.swift
//  Calculator App Final
//
//  Created by Jordan Sun on 10/13/19.
//  Copyright © 2019 Jordan Sun. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class SecondViewController: UIViewController {
    @IBOutlet weak var MapView: MKMapView!
    
    let locationManager = CLLocationManager()
    let regionInMeters:Double = 10000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationServices()
        // Do any additional setup after loading the view.
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func centerViewOnUserLocation () {
        if let location = locationManager.location?.coordinate{
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            MapView.setRegion(region, animated: true)
        }
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled(){
            setupLocationManager()
            checkLocationAuthorization()
        }
        else {
            //show  alert letting the user know they have to turn this on.
        }
    }
    
    func checkLocationAuthorization () {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            MapView.showsUserLocation = true
            centerViewOnUserLocation()
            //Do map stuff
            break
        case .denied:
            // Show alert instructing them how to turn on permissions
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        case .restricted:
            //show an alert lettig them know what's up
            break
        case .authorizedAlways:
            break
        @unknown default:
            break
        }
    }


}

extension SecondViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        guard let location = locations.last else { return }
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion.init(center: center, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
        MapView.setRegion(region, animated: true)
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus){
        checkLocationAuthorization()
    }
}
