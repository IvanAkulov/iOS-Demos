//
//  ViewController.swift
//  Callbacks_1
//
//  Created by Ivan Akulov on 25/10/2017.
//  Copyright © 2017 Ivan Akulov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if case let controller as SecondViewController = segue.destination, segue.identifier == "segue" {
            controller.completion = { [weak self] text in
                guard let `self` = self else { return }
                self.label.text = text
            }
        }
    }
}

