//
//  DataSource.swift
//  WeatherApp
//
//  Created by YAUHENI IVANIUK on 10/10/18.
//  Copyright © 2018 Yauheni Ivaniuk. All rights reserved.
//

import Foundation

class DataSource {
  private var weather: Weather!
  private var mockData = WeatherMockData()
  
  init() {
    weather = setWeather()
  }
  
  private func setWeather() -> Weather {
    return mockData.currentWeather()
  }
  
  func currentWather() -> Weather {
    weather = setWeather()
    return weather
  }
}
