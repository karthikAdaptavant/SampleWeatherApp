// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let list = try? newJSONDecoder().decode(List.self, from: jsonData)

import Foundation

// MARK: - List
struct ListData: Codable, Identifiable {
    let dt: Int
    let main: Main
    let weather: [Weather]
    let clouds: Clouds
    let wind: Wind
    let visibility: Int
    let pop: Double
    let dtTxt: String
    var id: UUID = UUID()
    
    enum CodingKeys: String, CodingKey {
        case dt
        case main
        case weather
        case clouds
        case wind
        case visibility
        case pop
        case dtTxt = "dt_txt"
    }
    
    var date: Date {
        Date(timeIntervalSince1970: TimeInterval(dt)) 
    } 
    
    var dateFormatted: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: date)
    }
}
