//
//  ContentView.swift
//  WeatherApp
//
//  Created by Karthik on 24/04/22.
//

import SwiftUI
import CoreKit
import DIKit

struct HomeView: View {    
    @ObservedInject var viewModel: HomeViewModel
    @State var canPresentList = true    
    
    fileprivate func destinationScreen(_ data: WeatherData) -> WeatherListView {
        let vm = WeatherListViewModel(weatherData: data)
        let view = WeatherListView(viewModel: vm)
        return view 
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {                  
                    switch viewModel.fetchState {
                    case .idle:
                        EmptyView()
                    case .fetching:                  
                        ProgressView().scaleEffect(1.5, anchor: .center)
                    case .error:
                        PlaceHolderView(type: .error)
                    case .completed:
                        let vm = WeatherListViewModel(weatherData: viewModel.weatherData)
                        WeatherListView(viewModel: vm).navigatePush(whenTrue: $canPresentList)                                         
                    }
                }                
            }
            .navigationBarTitleDisplayMode(.large)
            .onAppear { 
                viewModel.fetchWeatherData()
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
