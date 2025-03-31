//
//  WeatherViewModel.swift
//  Diplom_03
//
//

import Foundation

final class WeatherViewModel {
    private var networkService: NetworkService
    
    var currentIndex: Int?
    var weatherInfoForCell: [WeatherModel] = []
    
    
    var didUpdateCurrentIndex: (() -> Void)?
    var didUpdateWeatherInfo: (() -> Void)?
    
    init() {
        self.networkService = NetworkService()
    }
    
    func updateCurrentIndex(newIndex: Int) {
        self.currentIndex = newIndex
        
        self.didUpdateCurrentIndex?()
    }
    
    func updateWeatherInfo() {
        let city = Cnst.cities[self.currentIndex!]
        
        self.networkService.getWeather(latitude: city.latitude, longitude: city.longitude) { [weak self] weather in
            
            guard let self = self else { return }
            
            
            self.weatherInfoForCell.removeAll()
            
            for index in 0...weather.daily.time.count - 1 {
                self.weatherInfoForCell.append(
                    WeatherModel(
                        date: String(weather.daily.time[index]),
                        minTemp: String(weather.daily.temperature2MMin[index]) + weather.dailyUnits.temperature2MMin + " -",
                        maxTemp: String(weather.daily.temperature2MMax[index]) + weather.dailyUnits.temperature2MMax,
                        windDirection: String(weather.daily.windDirection10MDominant[index]) + weather.dailyUnits.windDirection10MDominant,
                        maxWindSpeed: String(weather.daily.windSpeed10MMax[index]) + "" + weather.dailyUnits.windSpeed10MMax
                    )
                )
            }
            
            self.didUpdateWeatherInfo?()
        }
    }
    
}
