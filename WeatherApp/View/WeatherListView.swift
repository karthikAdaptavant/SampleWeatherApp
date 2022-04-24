//
//  ListView.swift
//  WeatherApp
//
//  Created by Karthik on 24/04/22.
//

import SwiftUI
import CoreKit
import SerializationKit

struct WeatherListView: View {    
    var viewModel: WeatherListViewModel
    
    fileprivate func destinationScreen(_ data: ListData) -> WeatherDetailView {
        let vm = WeatherDetailViewModel(weatherData: viewModel.weatherData, data: data)
        return WeatherDetailView(viewModel: vm)
    }
    
    var body: some View {
        List {
            ForEach(viewModel.weatherData.list) { listData in
                NavigationLink(destination: destinationScreen(listData)) { 
                    HStack {
                        Text(listData.dateFormatted)
                            .fontWeight(.medium)
                        Spacer()
                        Text(listData.main.tempMinToMax)
                            .fontWeight(.light)
                        listData.weather.first!.weatherIcon
                            .imageScale(.large)
                            .foregroundColor(.secondary)
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 22)
                    .cornerRadius(10)      
                }
            }
        }
        .emptyListPlaceholder(viewModel.weatherData.list, AnyView(PlaceHolderView(type: .empty)))
        .navigationTitle(viewModel.weatherData.city.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

//struct DaySummaryView_Previews: PreviewProvider {
//    static var previews: some View {
//        let data = Bundle.getData("WeatherApiResponse")        
//        let weatherData = CodableDecoder<WeatherData>().optionalDecode(data)!
//        let viewModel = WeatherListViewModel(weatherData: weatherData)
//        WeatherListView(viewModel: viewModel)
//    }
//}
