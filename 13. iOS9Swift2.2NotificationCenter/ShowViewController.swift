//
//  ShowViewController.swift
//  NotificationCenter
//
//  Created by Ivan Akulov on 15/03/16.
//  Copyright © 2016 Ivan Akulov. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController {
  
  @IBAction func redViewPressed(sender: AnyObject) {
      NSNotificationCenter.defaultCenter().postNotificationName("red", object: nil)
  }


  @IBAction func blueViewPressed(sender: AnyObject) {
    NSNotificationCenter.defaultCenter().postNotificationName("blue", object: nil)
  }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
