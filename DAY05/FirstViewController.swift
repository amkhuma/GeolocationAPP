//
//  FirstViewController.swift
//  DAY05
//
//  Created by Andile MKHUMA on 2018/10/08.
//  Copyright © 2018 Andile MKHUMA. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class FirstViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var MAP: MKMapView!
    var locationManager : CLLocationManager!
    var usersLocation : MKCoordinateRegion!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for place in Places.places {
            addPointInMap(lat: place.0, long: place.1, title: place.2, subtitle: place.3)
        }
        addPointInMap(lat: 48.896607, long: 2.3185009999999693, title: "Ecole 42", subtitle: "Software Engineering school in paris, they use macs and not windows")
        locationManager = CLLocationManager()
         self.locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        
        MAP.delegate = self
    }
    //set user's location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let myLoc:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegion(center: myLoc, span: span)
        self.usersLocation = region
    }
    
    
    @IBAction func findUserLocation(_ sender: UIButton) {
        self.MAP.showsUserLocation = true
        addPointInMap(lat: self.usersLocation.center.latitude, long: self.usersLocation.center.longitude, title: "Current Location", subtitle: "Pin Represents Your current location")
    }
    
    @IBAction func changeMapView(_ sender: UISegmentedControl)
    {
        if sender.selectedSegmentIndex == 0{
            MAP.mapType = MKMapType.standard
        }
        else if sender.selectedSegmentIndex == 1{
            MAP.mapType = MKMapType.satellite
        }
        else if sender.selectedSegmentIndex == 3{
            MAP.mapType = MKMapType.hybrid
        }
    }
    
    func addPointInMap(lat: Double, long: Double, title: String, subtitle: String)
    {
        let point = MKPointAnnotation()
        point.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
        point.title = title
        point.subtitle = subtitle
        MAP.setCenter(point.coordinate, animated: true)
        MAP.addAnnotation(point)
    }

}

