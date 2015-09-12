//
//  MapPin.swift
//  UniCycle
//
//  Created by Miwand Najafe on 2015-09-12.
//  Copyright (c) 2015 Miwand Najafe. All rights reserved.
//

import UIKit
import MapKit

final class MapPin: NSObject, MKAnnotation {
    var coordinate:CLLocationCoordinate2D
    var title:String?
    var subtitle:String?
    init(coordinate:CLLocationCoordinate2D,title:String,subtitle:String) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
    
   
}
