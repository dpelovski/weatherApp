//
//  CurrentWeather.swift
//  rainyshinycloudy
//
//  Created by Damian Pelovski on 3/14/17.
//  Copyright © 2017 Damian Pelovski. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    private var _cityName: String!
    private var _date: String!
    private var _weatherType: String!
    private var _currentTemp: Double!
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
            return _cityName
        }
       
        return _cityName
    }
    
    var date: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
            return _weatherType

        }
        
        return _weatherType
    }

    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
            return _currentTemp
        }
        
        return _currentTemp
    }

    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        
        let currentWeatherUrl = URL(string: CURRENT_WEATHER_URL)!
        
        Alamofire.request(currentWeatherUrl).responseJSON { response in
            
            let result = response.result
            
            if let dict = result.value as? [String : AnyObject] {
                
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                }
                
                if let weather = dict["weather"] as? [[String : AnyObject]] {
                    if let type = weather[0]["main"] as? String {
                        self._weatherType = type.capitalized
                    }
                    
                }
                
                if let temp = dict["main"] as? [String: AnyObject] {
                    if let kelvinTemp = temp["temp"] as? Double {
                        
                        let celsius = kelvinTemp - 273.15
                        self._currentTemp = celsius
                    }
                }
                
                
            }
            
           completed()
        }
        
    }
    
    
    
}



























