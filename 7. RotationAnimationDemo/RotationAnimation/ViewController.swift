//
//  ViewController.swift
//  RotationAnimation
//
//  Created by p1us on 04.10.15.
//  Copyright © 2015 Ivan Akulov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var timer: NSTimer!
  var degree = CGFloat(M_PI / 180)
  
  @IBOutlet weak var rotateButton: UIButton!
  @IBOutlet weak var startButton: UIButton!
  
  @IBOutlet weak var stopButton: UIButton!
  
  
  @IBAction func startButtonPressed(sender: AnyObject) {
    startButton.hidden = true
    stopButton.hidden = false
    
    timer = NSTimer.scheduledTimerWithTimeInterval(0.02, target: self, selector: "rotateRotateBtn", userInfo: nil, repeats: true)
    
  }
  
  
  @IBAction func stopButtonPressed(sender: AnyObject) {
    timer.invalidate()
    startButton.hidden = false
    stopButton.hidden = true
    
  }
  
  func rotateRotateBtn(){
    UIView.animateWithDuration(0.02, delay: 0, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
      
      self.rotateButton.transform = CGAffineTransformMakeRotation(self.degree)
      }) { (finished) -> Void in
        
        self.degree += CGFloat(M_PI / 180)
    }
  }
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    startButton.hidden = false
    stopButton.hidden = true
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

