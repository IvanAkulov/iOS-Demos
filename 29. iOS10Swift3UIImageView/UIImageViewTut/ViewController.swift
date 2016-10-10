//
//  ViewController.swift
//  UIImageViewTut
//
//  Created by Ivan Akulov on 10/10/2016.
//  Copyright © 2016 Ivan Akulov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let imageView = UIImageView(frame: CGRect(x: 0, y: self.view.frame.size.height / 2, width: self.view.frame.size.width, height: self.view.frame.size.height / 2))
    imageView.image = UIImage(named: "starW2")
    imageView.contentMode = .scaleAspectFit
    self.view.addSubview(imageView)
    
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

