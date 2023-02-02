//
//  URL+Extensions.swift
//  GoodWeather
//
//  Created by Toheed on 02/02/23.
//

import Foundation

extension URL {
    
    static func urlForWeatherAPI(city: String) -> URL? {
        return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&APPID=5936fc993cc803d29b45892386d83ec2&units=imperial")
    }    
}
