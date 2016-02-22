//
//  ViewController.swift
//  NSURLSession
//
//  Created by Ivan Akulov on 22/02/16.
//  Copyright © 2016 Ivan Akulov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var myWebView: UIWebView!
  override func viewDidLoad() {
    super.viewDidLoad()

    displayURL()
  }
  
  func displayURL() {
    let myURLAdress = "http://swiftbook.ru"
    let myURL = NSURL(string: myURLAdress)
    
    let URLTask = NSURLSession.sharedSession().dataTaskWithURL(myURL!) {
      myData, response, error in
      
      guard error == nil else { return }
      
      let myHTMLString = String(data: myData!, encoding: NSUTF8StringEncoding)
      self.myWebView.loadHTMLString(myHTMLString!, baseURL: nil)
      print(myHTMLString)
    }
    URLTask.resume()
  }
}

