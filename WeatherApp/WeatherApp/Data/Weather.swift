//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by YAUHENI IVANIUK on 10/10/18.
//  Copyright © 2018 Yauheni Ivaniuk. All rights reserved.
//

import Foundation

class Weather {
  let current: Int
  let low: Int
  let high: Int
  let condition: String
  
  init(current: Int, low: Int, high: Int, condition: String) {
    self.current = current
    self.low = low
    self.high = high
    self.condition = condition
  }
}
