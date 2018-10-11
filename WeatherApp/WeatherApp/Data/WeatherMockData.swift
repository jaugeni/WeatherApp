//
//  WeatherMockData.swift
//  WeatherApp
//
//  Created by YAUHENI IVANIUK on 10/10/18.
//  Copyright © 2018 Yauheni Ivaniuk. All rights reserved.
//

import Foundation

class WeatherMockData {
  private var weather: Weather!
  
  private enum Conditions {
    static var hot = ["Clear", "Clouds"]
    static var warm = ["Clear", "Clouds", "Rain", "Thunderstorm"]
    static var cold = ["Clear", "Clouds", "Snow"]
    static var chilly = ["Clear", "Clouds", "Rain"]
  }
  
  init() {
    weather = createWeather()
  }
  
  func currentWeather() -> Weather {
    weather = createWeather()
    return weather
  }
  
  private func createWeather() -> Weather? {
    let current = currentTemp()
    let low = lowMaxTemp(currentTemp: current, isLow: true)
    let high = lowMaxTemp(currentTemp: current, isLow: false)
    let condition = createCondition(currentTemp: current)
    return Weather(current: current, low: low, high: high, condition: condition)
  }
  
  private func createCondition(currentTemp: Int) -> String {
    switch currentTemp {
    case 20..<35:
      guard let randomCondition = Conditions.cold.randomElement() else {return ""}
      return randomCondition
    case 35..<60:
      guard let randomCondition = Conditions.chilly.randomElement() else {return ""}
      return randomCondition
    case 60..<78:
      guard let randomCondition = Conditions.warm.randomElement() else {return ""}
      return randomCondition
    default:
      guard let randomCondition = Conditions.hot.randomElement() else {return ""}
      return randomCondition
    }
  }
  
  private func currentTemp() -> Int {
    return Int.random(in: 20...95)
  }
  
  private func lowMaxTemp(currentTemp: Int, isLow: Bool) -> Int {
    let difference = isLow ? -10 : +10
    let secondVal = currentTemp + difference
    let randomTemp = isLow ? Int.random(in: secondVal...currentTemp) : Int.random(in: currentTemp...secondVal)
    return randomTemp
  }
  
}
