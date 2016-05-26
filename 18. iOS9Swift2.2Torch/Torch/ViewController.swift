//
//  ViewController.swift
//  Torch
//
//  Created by Ivan Akulov on 25/05/16.
//  Copyright © 2016 Ivan Akulov. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func buttonPressed(sender: AnyObject) {
    let device = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
    
    if device.hasTorch {
      do {
        try device.lockForConfiguration()
        device.torchMode = device.torchMode == AVCaptureTorchMode.On ? .Off : .On
        device.unlockForConfiguration()
        
      } catch {
        print(error)
      }
    }
    
  }

}

