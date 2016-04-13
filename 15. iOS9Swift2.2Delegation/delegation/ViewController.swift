//
//  ViewController.swift
//  delegation
//
//  Created by Ivan Akulov on 29/03/16.
//  Copyright © 2016 Ivan Akulov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SecondViewControllerDelegate {

  @IBOutlet weak var label: UILabel!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  func fillTheLabelWithInfo(info: String) {
    label.text = info
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "addData" {
      let destinationVC = segue.destinationViewController as! SecondViewController
      destinationVC.delegate = self
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

