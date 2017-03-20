//
//  ViewController.swift
//  PassDataViaNotifications
//
//  Created by Ivan Akulov on 06/03/2017.
//  Copyright © 2017 Ivan Akulov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(gotNotification), name: .notificationFromThirdViewController, object: nil)
        
    }
    
    func gotNotification(notification: Notification) {
        guard let userInfo = notification.userInfo, let text = userInfo["text"] as? String else { return }
        
        label.text = text
    }
}

extension Notification.Name {
    static let notificationFromThirdViewController = Notification.Name(rawValue: "notificationFromThirdViewController")
}

