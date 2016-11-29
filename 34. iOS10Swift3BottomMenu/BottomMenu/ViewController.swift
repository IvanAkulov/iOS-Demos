//
//  ViewController.swift
//  BottomMenu
//
//  Created by Ivan Akulov on 28/11/2016.
//  Copyright © 2016 Ivan Akulov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let bottomMenu = BottomMenu()
  
  @IBAction func tapped(_ sender: UIButton) {
    bottomMenu.toggleMenu()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

