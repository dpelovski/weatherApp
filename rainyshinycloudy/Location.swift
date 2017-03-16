//
//  Location.swift
//  rainyshinycloudy
//
//  Created by Damian Pelovski on 3/16/17.
//  Copyright © 2017 Damian Pelovski. All rights reserved.
//

import Foundation
import CoreLocation

//singelton class
class Location {
    
    static var sharedInstance = Location()
    
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
}
