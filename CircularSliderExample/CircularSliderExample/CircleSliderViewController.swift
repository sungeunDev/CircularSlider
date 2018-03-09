//
//  CircleSliderViewController.swift
//  CircularSliderExample
//
//  Created by Christopher Olsen on 3/3/16.
//  Copyright © 2016 Christopher Olsen. All rights reserved.
//

import UIKit

class CircleSliderViewController: UIViewController {
  
  @IBOutlet weak var sliderValueLabel: UILabel!
  @IBOutlet weak var sliderView: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // init slider view
    let frame = CGRect(x: 0, y: 0, width: sliderView.frame.width, height: sliderView.frame.height)
    let circularSlider = CircularSlider(frame: frame)
    
    // setup target to watch for value change
    circularSlider.addTarget(self, action: #selector(CircleSliderViewController.valueChanged(_:)), for: UIControlEvents.valueChanged)
    
    // setup slider defaults
    circularSlider.handleType = .bigCircle
    circularSlider.currentValue = 10
    circularSlider.lineWidth = 10
    
    // add to view
    sliderView.addSubview(circularSlider)
  }
  
  func valueChanged(_ slider: CircularSlider) {
    sliderValueLabel.text = "\(slider.currentValue)"
  }
}
