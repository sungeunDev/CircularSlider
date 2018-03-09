//
//  WithLabelsViewController.swift
//  CircularSliderExample
//
//  Created by Christopher Olsen on 3/4/16.
//  Copyright © 2016 Christopher Olsen. All rights reserved.
//

import UIKit

class WithLabelsViewController: UIViewController {

  @IBOutlet weak var sliderValue: UILabel!
  @IBOutlet weak var sliderView: UIView!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // init slider view
    let frame = CGRect(x: 0, y: 0, width: sliderView.frame.width, height: sliderView.frame.height)
    let circularSlider = CircularSlider(frame: frame)
    
    // setup target to watch for value change
    circularSlider.addTarget(self, action: #selector(WithLabelsViewController.valueChanged(_:)), for: UIControlEvents.valueChanged)
    
    // setup slider defaults
    circularSlider.maximumAngle = 270.0
    circularSlider.unfilledArcLineCap = .round
    circularSlider.filledArcLineCap = .round
    circularSlider.handleType = .bigCircle
    circularSlider.currentValue = 10
    circularSlider.lineWidth = 10
    circularSlider.labelDisplacement = -10.0
    circularSlider.innerMarkingLabels = ["0", "20", "40", "60", "80", "100"];
    
    // add to view
    sliderView.addSubview(circularSlider)
    
    // NOTE: create and set a transform to rotate the arc so the white space is centered at the bottom
    circularSlider.transform = circularSlider.getRotationalTransform()
  }
  
  func valueChanged(_ slider: CircularSlider) {
    sliderValue.text = "\(slider.currentValue)"
  }
}
