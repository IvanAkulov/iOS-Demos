//
//  ViewController.swift
//  CoreImageTut
//
//  Created by Ivan Akulov on 01/07/16.
//  Copyright © 2016 Ivan Akulov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var array = ["CISepiaTone", "CIPixellate", "CIGaussianBlur"]
  var image: UIImage!
  var tempArray: [String]!

  
  @IBOutlet weak var imageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tempArray = array
    let startImage = UIImage(named: "1")
    imageView.image = startImage
    
  } // viewDidLoad
  
  @IBAction func filterIt(sender: AnyObject) {
    
    let fileURL = NSBundle.mainBundle().URLForResource("1", withExtension: "png")
    let startImage = CIImage(contentsOfURL: fileURL!)
    
    if tempArray.count == 0 {
      
      let startImage = UIImage(named: "1")
      imageView.image = startImage
      tempArray = array
      
    } else {
      
      let filter = CIFilter(name: tempArray.removeFirst())
      filter?.setValue(startImage, forKey: kCIInputImageKey)
      
      let newImage = UIImage(CIImage: (filter?.outputImage)!)
      self.imageView.image = newImage
      
    } // else
  } // filterIt
}

