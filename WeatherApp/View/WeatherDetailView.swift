//
//  DetailView.swift
//  WeatherApp
//
//  Created by Karthik on 24/04/22.
//

import SwiftUI
import SerializationKit

struct WeatherDetailView: View {
    var viewModel: WeatherDetailViewModel
    
    var body: some View {
        VStack() {
            WeatherView            
            SummaryView
            Spacer()
        }
        .padding(.top, 100)
        .navigationTitle(viewModel.weatherData.city.name)
        .navigationBarTitleDisplayMode(.inline) 
    }
    
    private var WeatherView: some View {
        return AnyView(
            HStack {
                VStack(spacing: 4) {
                    HStack {
                        viewModel.data.weather.first!.weatherIcon
                            .renderingMode(.original)
                            .imageScale(.small)
                        Text("\(viewModel.data.main.tempFormatted)")
                            .fontWeight(.semibold)
                    }.font(.system(size: 50))
                        .frame(maxWidth: .infinity)
                    Text("\(viewModel.data.weather.first!.weatherDescription) - \(viewModel.data.main.feelsLikeFormatted)")
                        .foregroundColor(.secondary)
                }
            }
        )
    }
    
    private var SummaryView: some View {
        return AnyView(
            VStack {
                ZStack {
                    HStack {
                        detailView(
                            text: viewModel.data.main.humidityFormatted,
                            image: .init(systemName: "humidity")
                        )
                        detailView(
                            text: viewModel.data.wind.windSpeedFormatted,
                            image: .init(systemName: "wind")
                        ) 
                    }                    
                }
                .padding()
            }
        )
    }
    
    private func detailView(text: String, image: Image, offset: CGSize = .zero) -> some View {
        HStack {
            image
                .imageScale(.medium)
                .foregroundColor(.blue)
                .offset(offset)
            Text(text)
        }
    }
}

//struct WeatherDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        let data = Bundle.getData("WeatherApiResponse")        
//        let weatherData = CodableDecoder<WeatherData>().optionalDecode(data)!        
//        let viewModel = WeatherDetailViewModel(weatherData: weatherData, data: weatherData.list.first!)
//        WeatherDetailView(viewModel: viewModel)
//    }
//}
