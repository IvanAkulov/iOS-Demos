//
//  SecondVC.swift
//  PassData
//
//  Created by p1us on 26.08.15.
//  Copyright © 2015 Ivan Akulov. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {

  @IBOutlet weak var label: UILabel!
  var textOfLabel: String = ""
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      label.text = textOfLabel
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
