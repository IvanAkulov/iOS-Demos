//
//  GreenViewController.swift
//  NoSegues_
//
//  Created by Ivan Akulov on 19/05/16.
//  Copyright © 2016 Ivan Akulov. All rights reserved.
//

import UIKit

class GreenViewController: UIViewController {
  
  var property = "GreenVC"

    override func viewDidLoad() {
        super.viewDidLoad()

        print(property)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
