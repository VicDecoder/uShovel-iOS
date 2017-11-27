//
//  MapViewController.swift
//  uShovel
//
//  Created by Victor Loyinmi on 2017-10-27.
//  Copyright © 2017 Team Byte. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
class MapViewController: UIViewController,CLLocationManagerDelegate
{

    
    @IBOutlet weak var mapView: MKMapView!
    private let manager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager,didUodateLocations locations:[CLLocation]){
        let location=locations[0]
        let span: MKCoordinateSpan=MKCoordinateSpanMake(0.01,0.01 )
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        mapView.setRegion(region, animated: true)
        
        self.mapView.showsUserLocation = true;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
        // Do any additional setup after loading the view, typically from a nib.
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

