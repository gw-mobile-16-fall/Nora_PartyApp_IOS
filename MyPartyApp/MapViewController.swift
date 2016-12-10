//
//  MapViewController.swift
//  MyPartyApp
//
//  Created by Nora Alhelal on 11/18/16.
//  Copyright © 2016 gwu. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

//protocol LocationFinderDelegateProtocol {
//    func locationFound(latitude: Double, longitude: Double)
//    func locationNotFound()
//}


class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    

    
    
    var passedAddress: String!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("You recived address #\(passedAddress)!")

        mapView.delegate = self
        addressToCoordinates(address: passedAddress)
        
        // Do any additional setup after loading the view.
  //      locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
    }
    
    // MARK: - MKMapView delegate
    

    
//    func mapViewWillStartLoadingMap(_ mapView: MKMapView) {
//        NSLog("mapViewWillStartLoadingMap")
//    }
//        
//    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
//        NSLog("mapViewDidFinishLoadingMap")
//    }
//        
//    func mapViewDidStopLocatingUser(_ mapView: MKMapView) {
//        NSLog("mapViewDidStopLocatingUser")
//    }
    
    func addressToCoordinates (address: String) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address, completionHandler: {(placemarks, error) in
            if error != nil {
                print(error!)
                return }
               // else
            if (placemarks?.count)! > 0 {
 
                let placemark = placemarks?[0]
                let location = placemark?.location
                let coordinate = location?.coordinate
                print("\nlat: \(coordinate!.latitude), long: \(coordinate!.longitude)")
 
                    let span = MKCoordinateSpanMake(0.02, 0.02)
                    let region = MKCoordinateRegion(center: (location?.coordinate)!, span: span)
  
                    self.mapView.setRegion(region, animated: true)
                    let annotation = MKPointAnnotation()
                    let foundPlace = CLLocationCoordinate2D(latitude: coordinate!.latitude, longitude: coordinate!.longitude)
                    annotation.coordinate = foundPlace
                    self.mapView.addAnnotation(annotation)
            }
        })
    }
}


//extension MapViewController : CLLocationManagerDelegate {
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        if status == .authorizedWhenInUse {
//            locationManager.requestLocation()
//        }
//        else {
//            delegate?.locationNotFound()
//        }
//        
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        
//       // if let coordinate = locations[0].coordinate
//        if let location = locations.first {
//            print("location:: (location)")
//        }
//        
//        delegate?.locationFound(latitude: coordinate.latitude, longitude: locations.longitude)
//    }
//    
//    
//    }
//    
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        print(error.localizedDescription)
//        
//        delegate?.locationNotFound()
//    }
