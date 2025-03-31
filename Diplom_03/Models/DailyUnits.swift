//
//  DailyUnits.swift
//  Diplom_03
//
//

import Foundation

final class DailyUnits: Codable {
    let time: String
    let temperature2MMax: String
    let temperature2MMin: String
    let windSpeed10MMax: String
    let windDirection10MDominant: String

    enum CodingKeys: String, CodingKey {
        case time
        case temperature2MMax = "temperature_2m_max"
        case temperature2MMin = "temperature_2m_min"
        case windSpeed10MMax = "wind_speed_10m_max"
        case windDirection10MDominant = "wind_direction_10m_dominant"
    }

    init(time: String, temperature2MMax: String, temperature2MMin: String, windSpeed10MMax: String, windDirection10MDominant: String) {
        self.time = time
        self.temperature2MMax = temperature2MMax
        self.temperature2MMin = temperature2MMin
        self.windSpeed10MMax = windSpeed10MMax
        self.windDirection10MDominant = windDirection10MDominant
    }
}
