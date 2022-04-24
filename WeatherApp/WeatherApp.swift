//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Karthik on 24/04/22.
//

import SwiftUI
import DIKit
import Swinject
import NetworkKit

@main
struct WeatherApp: App {
    
    init() {
        setupDI()
        hideAutolayoutWarnings()
        removeTableViewExtraTopPadding()
    }
   
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}

extension WeatherApp {

    private func setupDI() {
        SwiftDI.shared.setup(
            assemblies: [
                ServiceAssembly(),
                ViewModelAssembly()
            ],
            inContainer: Container()
        )        
    }
    
    private func hideAutolayoutWarnings() {
        UserDefaults.standard.set(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
    }
    
    private func removeTableViewExtraTopPadding() {
        if #available(iOS 15.0, *) {
            UITableView.appearance().sectionHeaderTopPadding = .leastNonzeroMagnitude;
        }
    }
}
