//
//  Models.swift
//  weazer_itstep
//
//  Created by Daniyal Ganiuly on 06.02.2023.
//

import Foundation


struct WeatherModel: Codable {
    let timezone: String
    let current: CurrentWeather
    
    
}


struct CurrentWeather: Codable {
    let temp: Float
    let weather: [WeatherInfo]
}


struct WeatherInfo: Codable {
    let main: String
    let description: String
}
