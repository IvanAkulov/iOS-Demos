//
//  SecondViewController.swift
//  delegation
//
//  Created by Ivan Akulov on 29/03/16.
//  Copyright © 2016 Ivan Akulov. All rights reserved.
//

import UIKit

protocol SecondViewControllerDelegate {
  func fillTheLabelWithInfo(info: String)
}

class SecondViewController: UIViewController {

  var delegate: SecondViewControllerDelegate?
  
  @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  

  @IBAction func addDataPressed(sender: AnyObject) {
    let info = textField.text
    delegate?.fillTheLabelWithInfo(info!)
    self.navigationController?.popViewControllerAnimated(true)
    
  }
}
