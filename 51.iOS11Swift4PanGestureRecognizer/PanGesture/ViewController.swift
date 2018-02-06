//
//  ViewController.swift
//  PanGesture
//
//  Created by Ivan Akulov on 05/02/2018.
//  Copyright © 2018 Ivan Akulov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var orangeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(dragTheView))
        orangeView.addGestureRecognizer(panGestureRecognizer)
        
    }

    @objc func dragTheView(recognizer: UIPanGestureRecognizer) {
        
        if recognizer.state == .began {
            print("Gesture began")
        } else if recognizer.state == .changed {
            
            let translation = recognizer.translation(in: self.view)
            tiltTheView(with: translation)
            
            let newX = orangeView.center.x + translation.x
            let newY = orangeView.center.y + translation.y
            
            orangeView.center = CGPoint(x: newX, y: newY)
            recognizer.setTranslation(CGPoint.zero, in: self.view)
            
        } else if recognizer.state == .ended {
            
            if orangeView.center.x < 20 {
                UIView.animate(withDuration: 0.2, animations: { [unowned self] in
                    self.orangeView.center.x = -self.orangeView.frame.size.width
                })
            } else if orangeView.center.x > self.view.frame.size.width - 20 {
                UIView.animate(withDuration: 0.2, animations: { [unowned self] in
                    self.orangeView.center.x = self.view.frame.size.width + self.orangeView.frame.size.width
                })
            }
            
            UIView.animate(withDuration: 0, delay: 1, options: [], animations: {
                self.orangeView.transform = .identity
                self.orangeView.center = self.view.center
            })
        }
    }
    
    private func tiltTheView(with translationValue: CGPoint) {
        let translationMoved = self.view.center.x - self.orangeView.center.x
        let divKoef = (self.view.frame.size.width / 2) / 0.6
        
        orangeView.transform = CGAffineTransform(rotationAngle: translationMoved / divKoef)
    }
}



















