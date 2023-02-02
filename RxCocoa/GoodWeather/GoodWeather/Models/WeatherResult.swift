//
//  WeatherResult.swift
//  GoodWeather
//
//  Created by Toheed on 02/02/23.
//

import Foundation
//5936fc993cc803d29b45892386d83ec2

struct WeatherResult: Decodable {
    let main: Weather
}

extension WeatherResult {
    //Empty weather result, To display in catch block
    static var empty: WeatherResult {
        return WeatherResult(main: Weather(temp: 0.0, humidity: 0.0))
    }
    
}

struct Weather: Decodable {
    let temp: Double
    let humidity: Double
}
