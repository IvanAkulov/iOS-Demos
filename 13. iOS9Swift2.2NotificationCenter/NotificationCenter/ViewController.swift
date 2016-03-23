//
//  ViewController.swift
//  NotificationCenter
//
//  Created by Ivan Akulov on 15/03/16.
//  Copyright © 2016 Ivan Akulov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var imageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(setImageToRed), name: "red", object: nil)
    NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(setImageToBlue), name: "blue", object: nil)
  }
  
  func setImageToBlue(notification: NSNotification) {
    imageView.backgroundColor = UIColor.blueColor()
  }

  func setImageToRed(notification: NSNotification) {
    imageView.backgroundColor = UIColor.redColor()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

