//
//  MyView.swift
//  Xib
//
//  Created by Ivan Akulov on 06/06/16.
//  Copyright © 2016 Ivan Akulov. All rights reserved.
//

import UIKit

@IBDesignable class MyView: UIView {

  @IBOutlet weak var myLabel: UILabel!
  
  @IBInspectable var textLabelText: String {
    get {
      return myLabel.text!
    }
    
    set(textLabelText) {
      myLabel.text = textLabelText
    }
  }
  
  var view: UIView!
  var nibName: String = "MyView"
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  func loadFromNib() -> UIView {
    let bundle = NSBundle(forClass: self.dynamicType)
    let nib = UINib(nibName: nibName, bundle: bundle)
    let view = nib.instantiateWithOwner(self, options: nil).first as! UIView
    
    return view
  }
  
  func setup() {
    view = loadFromNib()
    view.frame = bounds
    view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
    
    addSubview(view)
  }
  
  
  
  
  
  
  
  

}
