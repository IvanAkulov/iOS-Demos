//
//  ViewController.swift
//  ReadFromFile
//
//  Created by Ivan Akulov on 28/12/2016.
//  Copyright © 2016 Ivan Akulov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    var text: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.text = text
        automaticallyAdjustsScrollViewInsets = false
    }
}

