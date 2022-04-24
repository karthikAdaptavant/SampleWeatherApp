//
//  File.swift
//  WeatherApp
//
//  Created by Karthik on 24/04/22.
//

import Foundation
import NetworkKit
import LoggerKit

enum WeatherApiURLRequest: NetworkRequestable {
    
    case fetchWeather(city: String)
    
    var url: URL {
        return URL(string: "https://pro.openweathermap.org")!
    }
    
    var path: String {
        return "/data/2.5/forecast/hourly"
    }
    
    var httpMethod: HTTPMethod {
        return .get        
    }
    
    var queryParameter: [String : Any]? {
        switch self {
        case .fetchWeather(let city):
            return ["q": city, "appid": "65d00499677e59496ca2f318eb68c049"]
        }
    }
    
    var parameters: Any? { return nil }
    
    var authorizationType: AuthorizationType { .none }
    
    var encoding: RequestContentType { .json }
}

class WeatherApiService {
    
    var networkKit: NetworkKit<WeatherApiURLRequest>
    
    init() {
        self.networkKit = NetworkKit(with: .shared)
        NetworkLogger.Logger.logConfig = .init(enable: true, severity: .debug)
    }
    
    func fetchWeather(city: String) {        
        self.networkKit.requestJson(.fetchWeather(city: city)) { json in
            print(json)
        }
    }
}
