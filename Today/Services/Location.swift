//
//  Location.swift
//  Today
//
//  Created by Daniil on 16.06.2025.
//
import CoreLocation
import Combine


class LocationManager: NSObject, CLLocationManagerDelegate {
    static let shared = LocationManager()
    
    private let manager = CLLocationManager()
    private let geocoder = CLGeocoder()
    
    @Published var latitude: Double?
    @Published var longitude: Double?
    @Published var city: String?
    private var lastLocation: CLLocation?

    private override init() {
        super.init()
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }

        latitude = location.coordinate.latitude
        longitude = location.coordinate.longitude

        
        if let last = lastLocation, location.distance(from: last) < 100 {
            return
        }

        lastLocation = location

        geocoder.reverseGeocodeLocation(location) { [weak self] placemarks, error in
            guard error == nil else {
                print("⛔️ Ошибка геокодирования: \(error!.localizedDescription)")
                return
            }

            if let cityName = placemarks?.first?.locality {
                self?.city = cityName
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("Error location update: \(error.localizedDescription)")
    }
    
    
    
}
