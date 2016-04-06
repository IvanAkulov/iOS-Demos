//
//  ViewController.swift
//  LocalNotifcations
//
//  Created by Ivan Akulov on 28/03/16.
//  Copyright © 2016 Ivan Akulov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func sendNotification() {
    let notification = UILocalNotification()
    notification.alertTitle = "alert title"
    notification.alertBody = "alert body"
    notification.alertAction = "run the app"
    notification.fireDate = NSDate(timeIntervalSinceNow: 5)
    
    UIApplication.sharedApplication().scheduleLocalNotification(notification)
  }
  
  @IBAction func sendLocalNotification(sender: UIButton) {
    sendNotification()
    
    print("notification will appear in 5 seconds")
  }

}

