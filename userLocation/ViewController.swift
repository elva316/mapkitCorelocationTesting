//
//  ViewController.swift
//  userLocation
//
//  Created by elva wang on 11/9/17.
//  Copyright © 2017 elva wang. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    // Map 
    @IBOutlet weak var map: MKMapView!
//    private var mapChangedFromUserInteraction = false

    let manager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {  // going to extract user's location
        let location = locations[0]   // the most position of user
        let span: MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)    //  how much we want user to zoomed in location
        let myLocation : CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)   // this is the location of the user
        let region: MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)    // combine, this is how much we want to current user zoom in
        map.setRegion(region, animated: true)     //   we set on the map
        self.map.showsUserLocation = true         //   adding the blue dot
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest     // where the user is
        manager.requestWhenInUseAuthorization()              //  get location wehen user using the app
        manager.startUpdatingLocation()                 //  update each time location is updated
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

