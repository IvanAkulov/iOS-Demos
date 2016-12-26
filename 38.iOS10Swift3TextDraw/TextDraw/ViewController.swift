//
//  ViewController.swift
//  TextDraw
//
//  Created by Ivan Akulov on 26/12/2016.
//  Copyright © 2016 Ivan Akulov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let text: NSString = "SwiftBook.ru"
        let newImage = textToImage(text: text, toImage: imageView.image!, atPoint: CGPoint(x: 20, y: imageView.frame.height - 40))
        imageView.image = newImage
    }
    
    func textToImage(text: NSString, toImage image: UIImage, atPoint point: CGPoint) -> UIImage {
        
        let textColor = UIColor.white
        let textFont = UIFont(name: "Helvetica Bold", size: 20)!
        
        let scale = UIScreen.main.scale
        
        UIGraphicsBeginImageContextWithOptions(image.size, false, scale)
        
        let textFontAttributes = [
            NSFontAttributeName: textFont,
            NSForegroundColorAttributeName: textColor
        ] as [String: Any]
        
        image.draw(in: CGRect(origin: CGPoint.zero, size: image.size))
        
        let rect = CGRect(origin: point, size: image.size)
        text.draw(in: rect, withAttributes: textFontAttributes)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
        
    }
   }









