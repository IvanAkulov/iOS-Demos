//
//  ViewController.swift
//  KeyChainTut
//
//  Created by Ivan Akulov on 17/04/2017.
//  Copyright © 2017 Ivan Akulov. All rights reserved.
//

import UIKit
import Locksmith

class ViewController: UIViewController {
    
    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func saveCredentials(sender: UIButton){
        if let login = login.text, let password = password.text {
            do {
                try Locksmith.saveData(data: ["login" : login, "password": password], forUserAccount: "MyAccount")
            } catch {
                print("Save error")
            }
        } else { return }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dictionary = Locksmith.loadDataForUserAccount(userAccount: "MyAccount") as? [String: AnyObject]
        print(dictionary)
        
    }
}






















