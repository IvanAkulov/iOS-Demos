//
//  ViewController.swift
//  Highscore
//
//  Created by p1us on 26.09.15.
//  Copyright © 2015 Ivan Akulov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var score = 0
  var highscore = 0
  
  @IBOutlet weak var currentScoreLabel: UILabel!
  
  @IBOutlet weak var highscoreLabel: UILabel!
  
  @IBAction func resetButtonPressed(sender: AnyObject) {
    
    score = 0
    
    currentScoreLabel.text = "Current Score: \(score)"
    highscoreLabel.text = "Highscore: \(highscore)"
    
  }
  
  @IBAction func plusOneButtonPressed(sender: AnyObject) {
    
    score += 1
    
    currentScoreLabel.text = "Current Score: \(score)"
    
    if score > highscore {
      highscore = score
      
      highscoreLabel.text = "Highscore: \(highscore)"
      
      NSUserDefaults.standardUserDefaults().setValue(highscore, forKey: "highscore")
    }
  }
  
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    currentScoreLabel.text = "Current Score: \(score)"
    
    if NSUserDefaults.standardUserDefaults().valueForKey("highscore") != nil {
    
      highscore = NSUserDefaults.standardUserDefaults().valueForKey("highscore") as! NSInteger
      
      highscoreLabel.text = "Highscore: \(highscore)"
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

