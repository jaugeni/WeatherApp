//
//  UIImageView + Animation.swift
//  WeatherApp
//
//  Created by YAUHENI IVANIUK on 10/10/18.
//  Copyright © 2018 Yauheni Ivaniuk. All rights reserved.
//

import UIKit

extension UIImageView {
  var imageWithFade: UIImage? {
    get {
      return self.image
    }
    set {
    UIView.transition(with: self,
                      duration: 1,
                      options: .transitionCrossDissolve,
                      animations: {
                        self.image = newValue
    }, completion: nil)
    }
  }
}
