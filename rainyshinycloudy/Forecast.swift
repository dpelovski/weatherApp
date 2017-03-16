//
//  Forecast.swift
//  rainyshinycloudy
//
//  Created by Damian Pelovski on 3/15/17.
//  Copyright © 2017 Damian Pelovski. All rights reserved.
//

import UIKit
import Alamofire


class Forecast {
    
    private var _date: String!
    private var _weatherType: String!
    private var _highTemp: String!
    private var _lowTemp: String!
    
    init(weatherDict: [String:AnyObject]) {
        if let temp = weatherDict["temp"] as? [String:AnyObject] {
            if let min = temp["min"] as? Double {
                    
                let celsius = round(min - 273.15)
                self._lowTemp = String(celsius)
                
            }
            
            if let max = temp["max"] as? Double {
                
                let celsiusMax = round(max - 273.15)
                self._highTemp = String(celsiusMax)
            }
        }
        
        
        if let weather = weatherDict["weather"] as? [[String: AnyObject]] {
            
            if let main = weather[0]["main"] as? String {
                
                self._weatherType = main
            }
        }
        
        if let dt = weatherDict["dt"] as? Double {
            
            let unixConvertedDate = Date(timeIntervalSince1970: dt)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self._date = unixConvertedDate.dayOfTheWeek()
        }
        
    }
    
    var date:String {
        if _date == nil {
            _date = ""
        }
        
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""            
        }
        
        return _weatherType
    }
    
    var highTemp: String {
        if _highTemp == nil {
            _highTemp = ""
        }
        
        return _highTemp
    }
    
    var lowTemp: String {
        if _lowTemp == nil {
            _lowTemp = ""
        }
        
        return _lowTemp
    }
    
    
}

//workaround to show only the day
extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}

















