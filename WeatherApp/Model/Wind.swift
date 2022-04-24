// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let wind = try? newJSONDecoder().decode(Wind.self, from: jsonData)

import Foundation

// MARK: - Wind
struct Wind: Codable {
    var speed: Double
    let deg: Int
    let gust: Double

    enum CodingKeys: String, CodingKey {
        case speed
        case deg
        case gust
    }
    
    var windSpeedFormatted: String {
        let rounded = speed.rounded()
        return String(rounded) + "km/h"
    }
}
