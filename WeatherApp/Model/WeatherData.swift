// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let weatherResponse = try? newJSONDecoder().decode(WeatherResponse.self, from: jsonData)

import Foundation

// MARK: - WeatherResponse
class WeatherData: Codable, Identifiable, ObservableObject {
    let cod: String
    let message: Double
    let cnt: Int
    let list: [ListData]
    let city: City
    var id: UUID = UUID()

    enum CodingKeys: String, CodingKey {
        case cod
        case message
        case cnt
        case list
        case city
    }
}
