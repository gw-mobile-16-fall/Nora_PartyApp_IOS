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
import SystemConfiguration

 


class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    //The address string that has been passed from PartiesTabelViewController
    var passedAddress: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self
        //send the recived address string to the addressToCoordinates function
        addressToCoordinates(address: passedAddress)
        
        //To sho alert when there is no internet connection
        connectionLostAlert()
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
    @IBAction func BackButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    //Show the alert when no connection found
    func connectionLostAlert() {
        
        if isConnectedToNetwork() == false
        {
            //Show this alert when no internet connection
            let alert = UIAlertController(title: "Lost Connection", message: "Please connect to the internet to show location on map", preferredStyle: .alert )
            
            let OKAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(OKAction)
            
            self.present(alert, animated: true)
            
    }
        else
        {
            print("Internet Connection Available!")
            //do nothing and show location
        }
    }
    
    //Check the internet connection function
    func isConnectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
            return false
        }
        
        let isReachable = flags == .reachable
        let needsConnection = flags == .connectionRequired
        
        return isReachable && !needsConnection
        
    }
    
    
}
