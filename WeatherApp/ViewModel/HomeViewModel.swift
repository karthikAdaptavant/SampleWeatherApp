//
//  HomeViewModel.swift
//  WeatherApp
//
//  Created by Karthik on 24/04/22.
//

import Foundation
import CoreKit
import SerializationKit
import DIKit

class HomeViewModel: ObservableObject {

    @Published var weatherData: WeatherData!
    @Published var fetchState: FetchState = .idle
    @Inject var weatherApi: WeatherApiService
    
    init() {                
    	// 
    }    
    
    func fetchWeatherData() {
        let data = Bundle.getData("WeatherApiResponse")
        let result = CodableDecoder<WeatherData>().decode(data)
        switch result {
        case .failure(let error):
            print(error)
            self.fetchState = .error            
        case .success(let data):
            self.weatherData = data
            self.fetchState = .completed            
        }
    } 
}
