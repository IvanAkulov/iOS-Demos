//
//  ViewController.swift
//  DelegateDemo
//
//  Created by p1us on 04.10.15.
//  Copyright © 2015 Ivan Akulov. All rights reserved.
//

import UIKit

extension ViewController: SecondViewControllerDelegate {
  func hideScreen(viewController: UIViewController) {
    viewController.willMoveToParentViewController(nil)
    viewController.removeFromParentViewController()
    viewController.view.removeFromSuperview()
  }
}

class ViewController: UIViewController {
  
  var secondVC: SecondViewController!

  @IBAction func goForwardButtonPressed(sender: AnyObject) {
    
    addChildViewController(secondVC)
    view.addSubview(secondVC.view)
    secondVC.didMoveToParentViewController(self)
    
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    secondVC = storyboard?.instantiateViewControllerWithIdentifier("SecondViewController") as! SecondViewController
    secondVC.delegate = self
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

