//
//  MainViewModel.swift
//  Today
//
//  Created by Daniil on 15.06.2025.
//
import Combine

class MainViewModel: ObservableObject {
    @Published var latitude: Double?
    @Published var longitude: Double?
    @Published var city: String?
    @Published var currentTemp: Double?
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        LocationManager.shared.$city
            .assign(to: \.city, on: self)
            .store(in: &cancellables)

        LocationManager.shared.$city
            .compactMap { $0 } // фильтруем nil
            .sink { [weak self] city in
                self?.getWeather(for: city)
            }
            .store(in: &cancellables)
    }
    
    func getWeather(for city: String) {
        let weatherManager = WeatherAPI()
        weatherManager.getWeather(city: city) { Weather in
            self.currentTemp = Weather?.currentConditions?.temp
        }
    }
    
}
