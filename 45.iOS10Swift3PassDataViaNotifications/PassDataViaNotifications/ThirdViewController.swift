//
//  ThirdViewController.swift
//  PassDataViaNotifications
//
//  Created by Ivan Akulov on 06/03/2017.
//  Copyright © 2017 Ivan Akulov. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    let dictionary = ["text": "Got notification!"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.post(name: .notificationFromThirdViewController, object: nil, userInfo: dictionary)
    }
}
