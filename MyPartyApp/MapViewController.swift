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

 


class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    //The address string that has been passed from PartiesTabelViewController
    var passedAddress: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)

        mapView.delegate = self
        //send the recived address string to the addressToCoordinates function
        addressToCoordinates(address: passedAddress)
        
    }
    
 
    //To convert the Address String to coordinates
    func addressToCoordinates (address: String) {
        let geocoder = CLGeocoder()
        //gecode the input address
        geocoder.geocodeAddressString(address, completionHandler: {(placemarks, error) in
            if error != nil {
                print(error!)
                return }
               // else
            if (placemarks?.count)! > 0 {
                //see what placemark was found and get the first result
                let placemark = placemarks?[0]
                let location = placemark?.location
                //get the coordinates
                let coordinate = location?.coordinate
                    //The amount of to use for the span
                    let span = MKCoordinateSpanMake(0.02, 0.02)
                    //to define which portion of the map to display
                    let region = MKCoordinateRegion(center: (location?.coordinate)!, span: span)
                
                    self.mapView.setRegion(region, animated: true)
                    //To set a pin on the found location
                    let annotation = MKPointAnnotation()
                    let foundPlace = CLLocationCoordinate2D(latitude: coordinate!.latitude, longitude: coordinate!.longitude)
                    annotation.coordinate = foundPlace
                    self.mapView.addAnnotation(annotation)
                
            }
        })
    }
}
