//
//  ViewController.swift
//  My Lottie
//
//  Created by Алексей Пархоменко on 11/01/2019.
//  Copyright © 2019 Алексей Пархоменко. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    @IBOutlet weak var animationView: LOTAnimationView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSwitch()
        
        addWatermelon()
        
        let myHeart = LOTAnimatedSwitch(named: "like")
        myHeart.center = CGPoint(x: 70, y: 522)
        
        myHeart.setProgressRangeForOnState(fromProgress: 0, toProgress: 1)
        myHeart.setProgressRangeForOffState(fromProgress: 1, toProgress: 0)
        
        myHeart.addTarget(self, action: #selector(switchToggled(animatedSwitch:)), for: .valueChanged)
        
        view.addSubview(myHeart)
    }
    
    fileprivate func addSwitch() {
        let mySwitch = LOTAnimatedSwitch(named: "Switch")
        mySwitch.center = CGPoint(x: 70, y: 100)
        view.addSubview(mySwitch)
        
        mySwitch.setProgressRangeForOnState(fromProgress: 0.5, toProgress: 1)
        mySwitch.setProgressRangeForOffState(fromProgress: 1, toProgress: 0.5)
        
        mySwitch.addTarget(self, action: #selector(switchToggled(animatedSwitch:)), for: .valueChanged)
    }
    
    @objc func switchToggled(animatedSwitch: LOTAnimatedSwitch) {
        if animatedSwitch.isOn {
            print("The switch is on")
        } else {
            print("The switch is off")
        }
    }
    
    

    fileprivate func addWatermelon() {
        // Do any additional setup after loading the view, typically from a nib.
        animationView.setAnimation(named: "Watermelon")
        animationView.contentMode = .scaleAspectFit
        animationView.animationSpeed = 2
        //animationView.loopAnimation = true
        animationView.autoReverseAnimation = true
    }
    
    @IBAction func startAnimationPressed(_ sender: UIButton) {
        
        animationView.play { (finished) in
            print("End animation")
        }
    }
}

