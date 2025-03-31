//
//  NetworkService.swift
//  Diplom_03
//
//

import Foundation

private extension String {
    static let baseURL = "https://api.open-meteo.com/v1/forecast?"
}

private enum Components: String {
    case weatherInfo = "&daily=temperature_2m_max,temperature_2m_min,wind_speed_10m_max,wind_direction_10m_dominant"
}

private enum RequestType: String {
    case GET
    case POST
}

protocol INetworkService {
    func getWeather(latitude: Double, longitude: Double, completion: @escaping (Weather) -> Void)
}

final class NetworkService: INetworkService {
    
    func getWeather(
        latitude: Double,
        longitude: Double,
        completion: @escaping (Weather) -> Void
    ) {
        sendRequest(
            latitude: latitude,
            longitude: longitude,
            type: .weatherInfo,
            requestType: .GET
        ) { data in
            guard let data else { return }
            let array = try? JSONDecoder().decode(Weather.self, from: data)
            completion(array!)
        }
    }
    
    private func sendRequest(
        latitude: Double,
        longitude: Double,
        type: Components,
        requestType: RequestType = .GET,
        completion: @escaping (Data?) -> Void
    ) {
        let cityPartUrl = "latitude=\(latitude)&longitude=\(longitude)"
        guard let url = URL(string: .baseURL + cityPartUrl + type.rawValue) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = requestType.rawValue
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                completion(data)
            }
        } .resume()
    }
}
