//
//  Assemblies.swift
//  WeatherApp
//
//  Created by Karthik on 24/04/22.
//

import Foundation
import DIKit
import Swinject
import SwinjectAutoregistration

class ServiceAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(WeatherApiService.self, initializer: WeatherApiService.init).inObjectScope(.singleton)   
    }
}

class ViewModelAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(HomeViewModel.self, initializer: HomeViewModel.init).inObjectScope(.new)
    }
}
