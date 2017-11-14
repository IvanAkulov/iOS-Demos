//
//  SecondViewController.swift
//  Callbacks_1
//
//  Created by Ivan Akulov on 25/10/2017.
//  Copyright © 2017 Ivan Akulov. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    var completion: ((String) -> ())?
    
    @IBAction func backPressed(sender: UIButton) {
        getDataAndBack()
    }
    
    private func getDataAndBack() {
        guard let text = textField.text, text != "" else {
            
            completion?("no data")
            navigationController?.popViewController(animated: true)
            return
        }
        
        completion?(text)
        navigationController?.popViewController(animated: true)
    }
}
