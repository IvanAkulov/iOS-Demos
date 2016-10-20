//
//  ViewController.swift
//  iCall
//
//  Created by Ivan Akulov on 20/10/2016.
//  Copyright © 2016 Ivan Akulov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var textField: UITextField!
  @IBAction func makeCall(sender: UIButton) {
    callNumber(phoneNumber: textField.text!)
  }
  
  func callNumber(phoneNumber: String) {
    if let url = URL(string: "tel://\(phoneNumber)") {
      if #available(iOS 10, *) {
        UIApplication.shared.open(url, options: [:], completionHandler: { (success) in
          print(success)
        })
      } else {
        let success = UIApplication.shared.openURL(url)
        print(success)
      }
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

