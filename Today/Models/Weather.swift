//
//  Weather.swift
//  Today
//
//  Created by Daniil on 15.06.2025.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Weather: Codable {
    let queryCost: Int?
    let latitude, longitude: Double?
    let resolvedAddress, address, timezone: String?
    let tzoffset: Int?
    let description: String?
    let days: [CurrentConditions]?
    let alerts: [Alert]?
    let stations: Stations?
    let currentConditions: CurrentConditions?
}

// MARK: - Alert
struct Alert: Codable {
    let event, headline, ends: String?
    let endsEpoch: Int?
    let onset: String?
    let onsetEpoch: Int?
    let id, language: String?
    let link: String?
    let description: String?
}

// MARK: - CurrentConditions
struct CurrentConditions: Codable {
    let datetime: String?
    let datetimeEpoch: Int?
    let temp, feelslike, humidity, dew: Double?
    let precip, precipprob: Double?
    let snow, snowdepth: Int?
    let preciptype: [Icon]?
    let windgust, windspeed, winddir, pressure: Double?
    let visibility: Double?
    let cloudcover, solarradiation, solarenergy: Double?
    let uvindex: Int?
    let conditions: Conditions?
    let icon: Icon?
    let stations: [ID]?
    let source: Source?
    let sunrise: String?
    let sunriseEpoch: Int?
    let sunset: String?
    let sunsetEpoch: Int?
    let moonphase, tempmax, tempmin, feelslikemax: Double?
    let feelslikemin, precipcover: Double?
    let severerisk: Int?
    let description: String?
    let hours: [CurrentConditions]?
}

enum Conditions: String, Codable {
    case clear = "Clear"
    case overcast = "Overcast"
    case partiallyCloudy = "Partially cloudy"
    case rain = "Rain"
    case rainOvercast = "Rain, Overcast"
    case rainPartiallyCloudy = "Rain, Partially cloudy"
}

enum Icon: String, Codable {
    case clearDay = "clear-day"
    case clearNight = "clear-night"
    case cloudy = "cloudy"
    case partlyCloudyDay = "partly-cloudy-day"
    case partlyCloudyNight = "partly-cloudy-night"
    case rain = "rain"
}

enum Source: String, Codable {
    case comb = "comb"
    case fcst = "fcst"
    case obs = "obs"
}

enum ID: String, Codable {
    case f0644 = "F0644"
    case remote = "remote"
}

// MARK: - Stations
struct Stations: Codable {
    let f0644: F0644?

    enum CodingKeys: String, CodingKey {
        case f0644 = "F0644"
    }
}

// MARK: - F0644
struct F0644: Codable {
    let distance: Int?
    let latitude, longitude: Double?
    let useCount: Int?
    let id: ID?
    let name: String?
    let quality, contribution: Int?
}
