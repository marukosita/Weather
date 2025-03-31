//
//  CitySelectionViewModel.swift
//  Diplom_03
//
//

import Foundation

final class CitySelectionViewModel {
    var cities = Cnst.cities
    var onCitySelected: ((Int) -> Void)?
}
