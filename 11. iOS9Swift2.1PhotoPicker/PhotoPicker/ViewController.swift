//
//  ViewController.swift
//  PhotoPicker
//
//  Created by Ivan Akulov on 28/02/16.
//  Copyright © 2016 Ivan Akulov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

  var imagePicker: UIImagePickerController!
  
  @IBOutlet weak var imageView: UIImageView!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func takePictureClicked(sender: AnyObject) {
    
    imagePicker = UIImagePickerController()
    imagePicker.delegate = self
    imagePicker.sourceType = .Camera
    imagePicker.allowsEditing = true
    
    presentViewController(imagePicker, animated: true, completion: nil)
    
  }
  
  func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
    imagePicker.dismissViewControllerAnimated(true, completion: nil)
    imageView.image = editingInfo![UIImagePickerControllerOriginalImage] as? UIImage
  }

}

