//
//  UIlabel + Animation.swift
//  WeatherApp
//
//  Created by YAUHENI IVANIUK on 10/10/18.
//  Copyright © 2018 Yauheni Ivaniuk. All rights reserved.
//

import UIKit

extension UILabel {
  
  func fadeTransition() {
    let animation = CATransition()
    animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    animation.type = CATransitionType.fade
    animation.duration = 1
    layer.add(animation, forKey: CATransitionType.fade.rawValue)
  }
}
