//
//  DetailViewController.swift
//  UISearchController
//
//  Created by Alexey Efimov on 17/12/2018.
//  Copyright © 2018 Alexey Efimov. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var restaurant: Restaurant!

    @IBOutlet var restaurantImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = restaurant.name
        restaurantImage.image = UIImage(named: restaurant.name)
    }
}
