//
//  ViewController.swift
//  BigTitles
//
//  Created by Ivan Akulov on 02/10/2017.
//  Copyright © 2017 Ivan Akulov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var labelString: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "DetailScreen"
        label.text = labelString
        
        setupNavigationBar()
    }
    
    fileprivate func setupNavigationBar() {
        navigationItem.largeTitleDisplayMode = .never
    }
}

