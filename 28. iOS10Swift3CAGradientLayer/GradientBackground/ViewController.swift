//
//  ViewController.swift
//  GradientBackground
//
//  Created by Ivan Akulov on 07/09/16.
//  Copyright © 2016 Ivan Akulov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    let color1 = UIColor(red: 153 / 255, green: 26 / 255, blue: 61 / 255, alpha: 1.0).cgColor
    let color2 = UIColor(red: 243 / 255, green: 155 / 255, blue: 51 / 255, alpha: 1.0).cgColor
    let color3 = UIColor(red: 184 / 255, green: 34 / 255, blue: 69 / 255, alpha: 1.0).cgColor
    
    
    let gradientBackground = CAGradientLayer()
    gradientBackground.frame = self.view.bounds
    gradientBackground.colors = [color1, color2, color3]
    gradientBackground.startPoint = CGPoint(x: 0.0, y: 0.0)
    gradientBackground.endPoint = CGPoint(x: 0.0, y: 1.0)
    self.view.layer.insertSublayer(gradientBackground, at: 0)

  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

