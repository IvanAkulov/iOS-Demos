//
//  ViewController.swift
//  Colorful text
//
//  Created by p1us on 28.08.15.
//  Copyright © 2015 Ivan Akulov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var myLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    let timerOfColor = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: "colorfulText", userInfo: nil, repeats: true)
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func colorfulText(){
    
    let red = CGFloat(drand48())
    let green = CGFloat(drand48())
    let blue = CGFloat(drand48())
    
    myLabel.textColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    
  }

}

