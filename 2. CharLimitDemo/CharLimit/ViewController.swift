//
//  ViewController.swift
//  CharLimit
//
//  Created by p1us on 27.08.15.
//  Copyright © 2015 Ivan Akulov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

  @IBOutlet weak var myTextField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    myTextField.delegate = self
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
    if range.length + range.location > myTextField.text?.characters.count {
      return false
    }
    
    let newLimit = (myTextField.text?.characters.count)! + string.characters.count - range.length
    
    return newLimit <= 5
  }

}

