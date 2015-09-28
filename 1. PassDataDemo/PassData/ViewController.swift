//
//  ViewController.swift
//  PassData
//
//  Created by p1us on 26.08.15.
//  Copyright © 2015 Ivan Akulov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var textField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    let destinationVC: SecondVC = segue.destinationViewController as! SecondVC
    
    destinationVC.textOfLabel = textField.text!
  }


}

