//
//  ViewController.swift
//  CoreMotionTest
//
//  Created by Ivan Akulov on 10/06/16.
//  Copyright © 2016 Ivan Akulov. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
  
  let manager = CMMotionManager()

  @IBOutlet weak var myLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if manager.deviceMotionAvailable {
      manager.deviceMotionUpdateInterval = 0.5
      manager.startDeviceMotionUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: { (data: CMDeviceMotion?, error: NSError?) in
        
        print("Acceleration x \(data!.userAcceleration.x)")
        print("Rotation x \(data!.rotationRate.x)")
        print("Gravity z \(data!.gravity.z)")
        
        if data?.userAcceleration.x < -1.5 {
          self.view.backgroundColor = UIColor.redColor()
          self.myLabel.text = "Red"
        } else if data?.userAcceleration.x > 1.5 {
          self.view.backgroundColor = UIColor.greenColor()
          self.myLabel.text = "Green"
        }
      })
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

