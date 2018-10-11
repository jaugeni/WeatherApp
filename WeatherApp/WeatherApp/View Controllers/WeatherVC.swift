//
//  ViewController.swift
//  WeatherApp
//
//  Created by YAUHENI IVANIUK on 10/10/18.
//  Copyright © 2018 Yauheni Ivaniuk. All rights reserved.
//

import UIKit
import SnapKit

class WeatherVC: UIViewController {
  
  private enum Constants {
    static let backroundImage = UIImage(named: "Clear")
    static let refresh = "Refresh"
  }
  
  lazy var backgroundImageView: UIImageView =  {
    let imageView = UIImageView(image: Constants.backroundImage)
    imageView.clipsToBounds = true
    imageView.contentMode = .scaleAspectFill
    return imageView
  }()
  
  lazy var refreshBtn: UIButton = {
    let button = UIButton()
    button.setTitle(Constants.refresh, for: .normal)
    button.addTarget(self, action:  #selector(refresh(sender: )), for: .touchUpInside)
    button.titleLabel?.font = .systemFont(ofSize: 20)
    button.setTitleShadowColor(.darkGray, for: .normal)
    button.titleLabel?.shadowOffset = CGSize(width: 1, height: 1)
    return button
  }()
  
  lazy var currentTemperatureLbl: UILabel = {
    let label = createLbl(fontSize: 90, isBold: true)
    return label
  }()
  
  lazy var weatherConditionLbl: UILabel = {
    let label = createLbl(fontSize: 20, isBold: false)
    label.textAlignment = .left
    return label
  }()
  
  lazy var lowTempLbl: UILabel = {
    let label = createLbl(fontSize: 20, isBold: false)
    label.textAlignment = .center
    return label
  }()
  
  lazy var highTempLbl: UILabel = {
    let label = createLbl(fontSize: 20, isBold: false)
    label.textAlignment = .right
    return label
  }()
  
  lazy var conditionsStack: UIStackView = {
    let stackView = UIStackView()
    stackView.addArrangedSubview(weatherConditionLbl)
    stackView.addArrangedSubview(lowTempLbl)
    stackView.addArrangedSubview(highTempLbl)
    stackView.axis = .horizontal
    stackView.distribution = .fillEqually
    return stackView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setViews()
    setConstrains()
  }
  
  func setViews() {
    view.addSubview(backgroundImageView)
    view.addSubview(refreshBtn)
    view.addSubview(currentTemperatureLbl)
    view.addSubview(conditionsStack)
    
    displayWeather()
  }
  
  func setConstrains() {
    backgroundImageView.snp.makeConstraints { (make) in
      make.edges.equalToSuperview()
    }
    
    refreshBtn.snp.makeConstraints { (make) in
      make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
      make.centerX.equalTo(view.snp.centerX)
    }
    
    currentTemperatureLbl.snp.makeConstraints { (make) in
      make.centerX.equalTo(view.snp.centerX)
      make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
    }
    
    conditionsStack.snp.makeConstraints { (make) in
      make.top.equalTo(currentTemperatureLbl.snp.bottom).offset(20)
      make.leading.equalTo(view.snp.leading).offset(20)
      make.trailing.equalTo(view.snp.trailing).inset(20)
    }
  }
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  func displayWeather() {
    let dataSource = DataSource()
    let currentWeather = dataSource.currentWather()
    backgroundImageView.imageWithFade = UIImage(named: currentWeather.condition)
    currentTemperatureLbl.fadeTransition()
    currentTemperatureLbl.text = "\(currentWeather.current)°"
    weatherConditionLbl.fadeTransition()
    weatherConditionLbl.text = currentWeather.condition
    lowTempLbl.fadeTransition()
    lowTempLbl.text = "Low: \(currentWeather.low)°"
    highTempLbl.fadeTransition()
    highTempLbl.text = "High: \(currentWeather.high)°"
  }
  
  func createLbl(fontSize: CGFloat, isBold: Bool) -> UILabel {
    let label = UILabel()
    label.textColor = .white
    label.font = isBold ? .boldSystemFont(ofSize: fontSize) : .systemFont(ofSize: fontSize)
    label.shadowColor = .darkGray
    label.shadowOffset = CGSize(width: 1, height: 1)
    label.minimumScaleFactor = 0.5
    return label
  }
  
  @IBAction func refresh(sender: UIButton) {
    displayWeather()
  }


}

