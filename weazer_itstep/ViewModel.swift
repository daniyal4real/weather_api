//
//  ViewModel.swift
//  weazer_itstep
//
//  Created by Daniyal Ganiuly on 06.02.2023.
//

import Foundation



class WeatherViewModel: ObservableObject {
    @Published var title: String = "-"
    @Published var descriptionText: String = "-"
    @Published var temp: String = "-"
    @Published var timezone: String = "-"
    
    init() {
        fetchWeather()
    }
    
    func fetchWeather() {
//        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=8b9f776f695b68ae7da0bef7865b0554") else {
//            return
//        }
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?exclude=hourly,daily,minutely&lat=51.169392&lon=71.449074&units=imperil&appid=8b9f776f695b68ae7da0bef7865b0554") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let model = try JSONDecoder().decode(WeatherModel.self, from: data)
                DispatchQueue.main.async {
                    self.title = model.current.weather.first?.main ?? "No title"
                    self.descriptionText = model.current.weather.first?.description ?? "No description"
                    self.temp = "\(model.current.temp) F"
//                    self.temp = ("\((model.current.temp * 9/5) + 32) C")
                    self.timezone = model.timezone
                }
            }
            catch {
                print("failed")
            }
        }
        task.resume()
    }
}
