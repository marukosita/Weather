//
//  Cnst.swift
//  Diplom_03
//
//

import Foundation
import UIKit

final class Cnst {
    static let textColor: UIColor = .black
    static let backgroundColor: UIColor = .white
    static let btnBackgroundColor: UIColor = .lightGray
    static let cornerRadius: CGFloat = 20
    
    static let cities = [
        City(city: "Minsk", latitude: 53.9, longitude: 27.5667),
        City(city: "Berlin", latitude: 52.5244, longitude: 13.4105),
        City(city: "New York", latitude: 40.7143, longitude: -74.006),
        City(city: "Amsterdam", latitude: 52.374, longitude: 4.8897),
        City(city: "Dublin", latitude: 53.3331, longitude: -6.2489),
        City(city: "London", latitude: 51.5085, longitude: -0.1257)
    ]
    
    enum Text {
        static let chooseCityBtn = "Choose city"
    }
    enum UI {
        static let smallHorizontalOffset: CGFloat = 10
        
        static let mediumVerticalOffset: CGFloat = 20
        
        static let mainHeight: CGFloat = 50
        
        static let chooseCityBtnWidth: CGFloat = 0.35
        static let backBtnWidth: CGFloat = 0.35
        
        static let cellHorizontalOffset: CGFloat = 0.02
        static let dateLabelWidth: CGFloat = 0.35
        static let minTempLabelWidth: CGFloat = 0.2
        static let maxTempLabelWidth: CGFloat = 0.2
        static let windDirectionLabelWidth: CGFloat = 0.17
        static let maxWindSpeedLabelWidth: CGFloat = 0.27
    }
}
