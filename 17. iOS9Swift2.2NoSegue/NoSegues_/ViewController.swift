//
//  ViewController.swift
//  NoSegues_
//
//  Created by Ivan Akulov on 19/05/16.
//  Copyright © 2016 Ivan Akulov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBAction func buttonClicked(sender: UIButton) {
    
    if sender.titleLabel?.text == "Green" {
      let vc = storyboard?.instantiateViewControllerWithIdentifier("GreenVC") as! GreenViewController
      vc.property = "Green View Controller"
      self.navigationController?.pushViewController(vc, animated: true)
      
    } else {
      let vc = storyboard?.instantiateViewControllerWithIdentifier("BlueVC")
      self.presentViewController(vc!, animated: true, completion: nil)
    }
    
    
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

