// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let weather = try? newJSONDecoder().decode(Weather.self, from: jsonData)

import Foundation
import SwiftUI

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main: String
    let weatherDescription: String
    let icon: String

    enum CodingKeys: String, CodingKey {
        case id
        case main
        case weatherDescription = "description"
        case icon
    }
    
    var weatherIcon: Image! {
        switch icon {
        case "01d": return Image(systemName: "sun.max")
        case "01n": return Image(systemName: "moon")
        case "02d": return Image(systemName: "cloud.sun")
        case "02n": return Image(systemName: "cloud.moon")
        case "03d", "03n", "04d", "04n": return Image(systemName: "cloud")
        case "09d", "09n": return Image(systemName: "cloud.rain")
        case "10d": return Image(systemName: "cloud.sun.rain")
        case "10n": return Image(systemName: "cloud.moon.rain")
        case "11d", "11n": return Image(systemName: "cloud.bolt.rain")
        case "13d", "13n": return Image(systemName: "cloud.snow")
        case "50d", "50n": return Image(systemName: "cloud.fog")
        default: return Image(systemName: "sun.max")
        }
    }
}
