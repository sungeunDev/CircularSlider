//
//  TwoHandleViewController.swift
//  CircularSliderExample
//
//  Created by Christopher Olsen on 3/4/16.
//  Copyright © 2016 Christopher Olsen. All rights reserved.
//

import UIKit

class TwoHandleViewController: UIViewController {
  
  @IBOutlet weak var lowerValueLabel: UILabel!
  @IBOutlet weak var upperValueLabel: UILabel!
  @IBOutlet weak var sliderView: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // init slider view
    let frame = CGRect(x: 0, y: 0, width: sliderView.frame.width, height: sliderView.frame.height)
    let circularSlider = DoubleHandleCircularSlider(frame: frame)
    
    // setup target to watch for value change
    circularSlider.addTarget(self, action: #selector(TwoHandleViewController.valueChanged(_:)), for: UIControl.Event.valueChanged)
    
    // setup slider defaults
    // NOTE: sliderMaximumAngle must be set before currentValue and upperCurrentValue
    circularSlider.maximumAngle = 270.0
    circularSlider.unfilledArcLineCap = .round
    circularSlider.filledArcLineCap = .round
    circularSlider.currentValue = 10
    circularSlider.upperCurrentValue = 60
    circularSlider.lineWidth = 30
    
    // add to view
    sliderView.addSubview(circularSlider)
    
    // create and set a transform to rotate the arc so the white space is centered at the bottom
    circularSlider.transform = circularSlider.getRotationalTransform()
  }
  
  func valueChanged(_ slider: DoubleHandleCircularSlider) {
    lowerValueLabel.text = "\(slider.currentValue)"
    upperValueLabel.text = "\(slider.upperCurrentValue)"
  }
}
