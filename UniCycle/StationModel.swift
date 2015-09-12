//
//  StationModel.swift
//  UniCycle
//
//  Created by Miwand Najafe on 2015-09-12.
//  Copyright (c) 2015 Miwand Najafe. All rights reserved.
//

import Foundation
import MapKit

struct Station {
    var mapPins:NSMutableArray = []
    
    init(json:NSDictionary) {
        if let bikeStations = json["stationBeanList"] as? NSArray {
            var bikeShareDepots = bikeStations
            for var i = 0; i < bikeShareDepots.count; i++ {
                var availableBikes:Int?
                var availableDocks:Int?
                var Latitude:Float?
                var longitude:Float?
                var stationName:String?
                
                var bikeShareData = bikeShareDepots[i] as? NSDictionary
                if let bikeShare = bikeShareData {
                    if let bike = bikeShare["availableBikes"] as? Int {
                availableBikes = bike
                println(availableBikes!)
                    }
                    if let dock = bikeShare["availableDocks"] as? Int {
                     availableDocks = dock
                        println(availableDocks!)
                    }
                    if let lat = bikeShare["latitude"] as? Float {
                        Latitude = lat
                        println(Latitude!)
                    }
                    if let long = bikeShare["longitude"] as? Float {
                        longitude = long
                        println(longitude)
                    }
                    if let station = bikeShare["stationName"] as? String {
                        stationName = station
                        println(stationName!)
                    }
                    var pin = MapPin(coordinate: CLLocationCoordinate2D(latitude: CLLocationDegrees(Latitude!), longitude: CLLocationDegrees(longitude!)), title: stationName!, subtitle: "Bikes available \(availableBikes!)")
                    mapPins.addObject(pin)
                }
            }
        }
    }
}