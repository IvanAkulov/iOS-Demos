//
//  BezierCurves.swift
//  BezierCurves
//
//  Created by Ivan Akulov on 01/08/16.
//  Copyright © 2016 Ivan Akulov. All rights reserved.
//

import UIKit

@IBDesignable
class BezierCurves: UIView {

  override func drawRect(rect: CGRect) {
    
    let center: CGPoint = CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2)
    
    // drop
    let dropPath = UIBezierPath()
    dropPath.moveToPoint(center)
    dropPath.addCurveToPoint(center,
                             controlPoint1: CGPoint(x: center.x + 150, y: center.y + 150),
                             controlPoint2: CGPoint(x: center.x + -150, y: center.y + 150))
    
    let blueColor = UIColor.blueColor()
    blueColor.setStroke()
    
    dropPath.lineWidth = 4.0
    dropPath.stroke()
    
    
    //polygon
    let polygonPath = UIBezierPath()
    polygonPath.moveToPoint(center)
    polygonPath.addLineToPoint(CGPointMake(center.x + 43.3, center.y - 25))
    polygonPath.addLineToPoint(CGPointMake(center.x + 43.3, center.y - 75))
    polygonPath.addLineToPoint(CGPointMake(center.x, center.y - 100))
    polygonPath.addLineToPoint(CGPointMake(center.x - 43.3, center.y - 75))
    polygonPath.addLineToPoint(CGPointMake(center.x - 43.3, center.y - 25))
    polygonPath.closePath()
    
    let greenColor = UIColor.greenColor()
    greenColor.setFill()
    let orangeColor = UIColor.orangeColor()
    orangeColor.setStroke()
    polygonPath.fill()
    polygonPath.lineWidth = 5.0
    
    polygonPath.stroke()

    
    //  rectangle
    let rectanglePath = UIBezierPath(roundedRect: CGRectMake(100, 100, 100, 100), cornerRadius: 6)
    rectanglePath.lineWidth = 6.0
    
    let redColor = UIColor.redColor()
    redColor.setStroke()
    rectanglePath.stroke()

    
    
    
    
    
    
    
    
  }
}
