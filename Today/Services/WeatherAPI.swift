//
//  WeatherAPI.swift
//  Today
//
//  Created by Daniil on 15.06.2025.
//

import Foundation

class WeatherAPI {
    
    func parseWeather(from jsonData: Data) -> Weather? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        do {
            let weather = try decoder.decode(Weather.self, from: jsonData)
            return weather
        } catch {
            print("Decoding error: \(error)")
            return nil
        }
    }

   
    func getWeather(city cityName: String, completion: @escaping (Weather?) -> Void) {
        print(cityName)
        let url = URL(
            string:
                "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/\(cityName)?unitGroup=metric&key=PXD93BVZFAUL56EUJCHRL9CUC&contentType=json"
        )!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Network error: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            guard let data = data else {
                print("No data received from server")
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let weather = self.parseWeather(from: data)
            DispatchQueue.main.async {
                completion(weather)
            }
        }.resume()
    }
}
