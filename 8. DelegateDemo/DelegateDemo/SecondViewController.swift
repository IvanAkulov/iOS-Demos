//
//  SecondViewController.swift
//  DelegateDemo
//
//  Created by p1us on 04.10.15.
//  Copyright © 2015 Ivan Akulov. All rights reserved.
//

import UIKit

protocol SecondViewControllerDelegate {
  func hideScreen(viewController: UIViewController)
}

class SecondViewController: UIViewController {
  
  var delegate: SecondViewControllerDelegate!

  @IBAction func goBackButtonPressed(sender: AnyObject) {
    
    delegate.hideScreen(self)
    
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
