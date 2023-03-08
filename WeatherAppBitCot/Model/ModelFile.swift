//
//  ModelFile.swift
//  WeatherAppBitCot
//
//  Created by Sanketh S Deshpande on 08/03/23.
//

import Foundation
import ObjectMapper

struct CurrentData: Codable, Mappable{
    
    var coordinates: Coordinates?
    var weather: [CurrWeather]?
    var base: String?
    var main: CurrMain?
    var visibility: Int?
    var wind: CurrWind?
    var clouds: CurrCloud?
    var dt: Int?
    var sys: CurrSys?
    var timeZone: Int?
    var id: Int?
    var name: String?
    var cod: Int?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: ObjectMapper.Map) {
        coordinates <- map["coord"]
        weather <- map["weather"]
        base <- map["base"]
        main <- map["main"]
        visibility <- map["visibility"]
        wind <- map["wind"]
        clouds <- map["clouds"]
        dt <- map["dt"]
        sys <- map["sys"]
        timeZone <- map["timezone"]
        id <- map["id"]
        name <- map["name"]
        cod <- map["cod"]
    }
    
}

struct Coordinates: Codable, Mappable{
    
    var lat: Int?
    var lon: Int?
    
    init?(map: ObjectMapper.Map) {
        
    }
    
    mutating func mapping(map: ObjectMapper.Map) {
        lat <- map["lat"]
        lon <- map["lon"]
    }
    
}

struct CurrWeather: Codable,Mappable{
    
    var id: Int?
    var main: String?
    var description: String?
    var icon: String?
    
    init?(map: ObjectMapper.Map) {
        
    }
    
    mutating func mapping(map: ObjectMapper.Map) {
        id <- map["id"]
        main <- map["main"]
        description <- map["description"]
        icon <- map["icon"]
    }
    
}

struct CurrMain: Codable, Mappable{
    var temp: Int?
    var feelsLike: Int?
    var tempMin: Int?
    var tempMax: Int?
    var pressure: Int?
    var humidity: Int?
    
    init?(map: ObjectMapper.Map) {
        
    }
    
    mutating func mapping(map: ObjectMapper.Map) {
        temp <- map["temp"]
        feelsLike <- map["feels_like"]
        tempMin <- map["temp_min"]
        tempMax <- map["temp_max"]
        pressure <- map["pressure"]
        humidity <- map["humidity"]
    }
    
}

struct CurrWind: Codable, Mappable{
    var speed: Int?
    var deg: Int?
    
    init?(map: ObjectMapper.Map) {
        
    }
    
    mutating func mapping(map: ObjectMapper.Map) {
        speed <- map["speed"]
        deg <- map["deg"]
    }
}

struct CurrCloud: Codable, Mappable{
    var all: Int?
    
    init?(map: ObjectMapper.Map) {
        
    }
    
    mutating func mapping(map: ObjectMapper.Map) {
        all <- map["all"]
    }
}

struct CurrSys: Codable, Mappable{
    var type: Int?
    var id: Int?
    var country: String?
    var sunrise: Int?
    var sunset: Int?
    
    init?(map: ObjectMapper.Map) {
        
    }
    
    mutating func mapping(map: ObjectMapper.Map) {
        type <- map["type"]
        id <- map["id"]
        country <- map["country"]
        sunrise <- map["sunrise"]
        sunset <- map["sunset"]
    }
}

struct ForecastData: Codable, Mappable{
    
    var lat: Int?
    var lon: Int?
    var timeZone: String?
    var timeZoneOffset: Int?
    var current: CurrentForecast?
    var minutely: [String]?
    var hourly: [HourlyForecast]?
    var daily: [DailyForecast]?
    
    init?(map: ObjectMapper.Map) {
        
    }
    
    mutating func mapping(map: ObjectMapper.Map) {
        lat <- map["lat"]
        lon <- map["lon"]
        timeZone <- map["timezone"]
        timeZoneOffset <- map["timezone_offset"]
        current <- map["current"]
        minutely <- map["minutely"]
        hourly <- map["hourly"]
        daily <- map["daily"]
    }
}

struct CurrentForecast: Codable, Mappable{
    
    var dt: Int?
    var sunrise: Int?
    var sunset: Int?
    var temp: Int?
    var feelsLike: Int?
    var pressure: Int?
    var humidity: Int?
    var dewPoint: Int?
    var uvi: Int?
    var clouds: Int?
    var visibility: Int?
    var windSpeed: Int?
    var windDeg: Int?
    var weather: [CurrWeather]?
    
    init?(map: ObjectMapper.Map) {
        
    }
    
    mutating func mapping(map: ObjectMapper.Map) {
        dt <- map["dt"]
        sunrise <- map["sunrise"]
        sunset <- map["sunset"]
        temp <- map["temp"]
        feelsLike <- map["feels_like"]
        pressure <- map["pressure"]
        humidity <- map["humidity"]
        dewPoint <- map["dew_point"]
        uvi <- map["uvi"]
        clouds <- map["clouds"]
        visibility <- map["visibility"]
        windSpeed <- map["wind_speed"]
        windDeg <- map["wind_deg"]
        weather <- map["weather"]
    }
}

struct HourlyForecast: Codable, Mappable{
    
    var dt: Int?
    var temp: Int?
    var feelsLike: Int?
    var pressure: Int?
    var humidity: Int?
    var dewPoint: Int?
    var uvi: Int?
    var clouds: Int?
    var visibility: Int?
    var windSpeed: Int?
    var windDeg: Int?
    var windGust: Int?
    var weather: [CurrWeather]?
    var pop: Int?
    
    init?(map: ObjectMapper.Map) {
        
    }
    
    mutating func mapping(map: ObjectMapper.Map) {
        dt <- map["dt"]
        temp <- map["temp"]
        feelsLike <- map["feels_like"]
        pressure <- map["pressure"]
        humidity <- map["humidity"]
        dewPoint <- map["dew_point"]
        uvi <- map["uvi"]
        clouds <- map["clouds"]
        visibility <- map["visibility"]
        windSpeed <- map["wind_speed"]
        windDeg <- map["wind_deg"]
        windGust <- map["wind_gust"]
        weather <- map["weather"]
        pop <- map["pop"]
    }
}

struct DailyForecast: Codable, Mappable{
    
    var dt: Int?
    var temp: ForecastTemp?
    var sunrise: Int?
    var sunset: Int?
    var moonRise: Int?
    var moonSet: Int?
    var feelsLike: Int?
    var pressure: Int?
    var humidity: Int?
    var dewPoint: Int?
    var uvi: Int?
    var clouds: Int?
    var moonPhase: Int?
    var windSpeed: Int?
    var windDeg: Int?
    var windGust: Int?
    var weather: [CurrWeather]?
    var pop: Int?
    
    init?(map: ObjectMapper.Map) {
        
    }
    
    mutating func mapping(map: ObjectMapper.Map) {
        dt <- map["dt"]
        temp <- map["temp"]
        sunrise <- map["sunrise"]
        sunset <- map["sunset"]
        moonRise <- map["moonrise"]
        moonSet <- map["moonset"]
        feelsLike <- map["feels_like"]
        pressure <- map["pressure"]
        humidity <- map["humidity"]
        dewPoint <- map["dew_point"]
        uvi <- map["uvi"]
        clouds <- map["clouds"]
        moonPhase <- map["moon_phase"]
        windSpeed <- map["wind_speed"]
        windDeg <- map["wind_deg"]
        windGust <- map["wind_gust"]
        weather <- map["weather"]
        pop <- map["pop"]
    }
}

struct ForecastTemp: Codable, Mappable{
    
    var day: Int?
    var min: Int?
    var max: Int?
    var night: Int?
    var eve: Int?
    var morng: Int?
    
    init?(map: ObjectMapper.Map) {
        
    }
    
    mutating func mapping(map: ObjectMapper.Map) {
        day <- map["day"]
        min <- map["min"]
        max <- map["max"]
        night <- map["night"]
        eve <- map["eve"]
        morng <- map["morn"]
    }
}
