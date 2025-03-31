//
//  Daily.swift
//  Diplom_03
//
//

import Foundation

final class Daily: Codable {
    let time: [String]
    let temperature2MMax: [Double]
    let temperature2MMin: [Double]
    let windSpeed10MMax: [Double]
    let windDirection10MDominant: [Int]

    enum CodingKeys: String, CodingKey {
        case time
        case temperature2MMax = "temperature_2m_max"
        case temperature2MMin = "temperature_2m_min"
        case windSpeed10MMax = "wind_speed_10m_max"
        case windDirection10MDominant = "wind_direction_10m_dominant"
    }

    init(time: [String], temperature2MMax: [Double], temperature2MMin: [Double], windSpeed10MMax: [Double], windDirection10MDominant: [Int]) {
        self.time = time
        self.temperature2MMax = temperature2MMax
        self.temperature2MMin = temperature2MMin
        self.windSpeed10MMax = windSpeed10MMax
        self.windDirection10MDominant = windDirection10MDominant
    }
}
