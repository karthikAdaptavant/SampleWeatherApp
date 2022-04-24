// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let city = try? newJSONDecoder().decode(City.self, from: jsonData)

import Foundation

// MARK: - City
struct City: Codable {
    let id: Int
    let name: String
    let coord: Coord
    let country: String
    let timezone: Int
    let sunrise: Int
    let sunset: Int

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case coord
        case country
        case timezone
        case sunrise
        case sunset
    }
}
