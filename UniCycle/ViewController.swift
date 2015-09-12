//
//  ViewController.swift
//  UniCycle
//
//  Created by Miwand Najafe on 2015-09-12.
//  Copyright (c) 2015 Miwand Najafe. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    var endpoint = NSURL(string: "http://www.bikesharetoronto.com/stations/json")
     
    @IBOutlet weak var mapView: MKMapView!
    var locationManagers = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        self.locationManagers.delegate = self
        
        self.mapView.delegate = self
        self.locationManagers.startUpdatingLocation()
        self.locationManagers.requestAlwaysAuthorization()
        if let data = NSData(contentsOfURL: endpoint!){
        
        
        if let json = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as? NSDictionary {
            var station = Station(json: json)
            
            for pins in station.mapPins {
                mapView.addAnnotation(pins as? MapPin)
            }
        }
        }
//        if let data = NSData(contentsOfURL: endpoint!){
////        println(data)
//            
//            if let json = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as? NSDictionary {
////                println(json)
//                if let bikestations = json["stationBeanList"] as? NSArray {
//                    
//                    var bikeShareData = bikestations[0] as? NSDictionary
//                        if let bikeShare =  bikeShareData {
//                            println(bikeShare["availableBikes"])
//                             println(bikeShare["availableDocks"])
//                             println(bikeShare["latitude"])
//                             println(bikeShare["longitude"])
//                             println(bikeShare["stationName"])
//                    
//                    }
//                }
//            }
//        
//        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

