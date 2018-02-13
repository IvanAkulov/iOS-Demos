//
//  ViewController.swift
//  Icon
//
//  Created by Ivan Akulov on 13/02/2018.
//  Copyright © 2018 Ivan Akulov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func changeAppIcon(button: UIButton) {
        
        guard UIApplication.shared.supportsAlternateIcons else { return }
        
        UIApplication.shared.setAlternateIconName(button.currentTitle) { (error) in
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        delay(0.1) {
            UIApplication.shared.setAlternateIconName("woman") { (error) in
                if let error = error {
                    print(error)
                }
            }
        }
    }
    
    func delay(_ delay:Double, closure: @escaping ()->()) {
        let when = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
    }
}

