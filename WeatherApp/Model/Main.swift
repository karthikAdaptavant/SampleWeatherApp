// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let main = try? newJSONDecoder().decode(Main.self, from: jsonData)

import Foundation

// MARK: - Main
struct Main: Codable {
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let pressure: Int
    let seaLevel: Int
    let grndLevel: Int
    let humidity: Int
    let tempKf: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity 
        case tempKf = "temp_kf"
    }
    
    var tempFormatted: String {
        temp.convert(to: .celsius) 
    }
    
    var feelsLikeFormatted: String {
    	feelsLike.convert(to: .celsius)
    }
    
    var tempMinToMax: String {
        "\(tempMin.convert(to: .celsius)) / \(tempMax.convert(to: .celsius))" 
    }
    
    var humidityFormatted: String {
        String(humidity) + "%"
    }
}
