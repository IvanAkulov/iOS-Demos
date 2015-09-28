//
//  ViewController.swift
//  MapOnFly
//
//  Created by p1us on 27.09.15.
//  Copyright © 2015 Ivan Akulov. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController {
  
  
  var geocoder: CLGeocoder!
  
  @IBOutlet weak var textField: UITextField!
  
  @IBOutlet weak var mapView: MKMapView!
  

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    geocoder = CLGeocoder()
    
    textField.addTarget(self, action: "textFieldDidChanged", forControlEvents: UIControlEvents.EditingChanged)
    
  }
  
  func textFieldDidChanged(){
  
    geocoder.geocodeAddressString((textField.text!)) { (placemarks, error) -> Void in
      
      if error != nil {
        print("MapKit error \(error?.description)")
      }
      
      if placemarks != nil {
        if let placemark = placemarks?.first {
          
          let annotation = MKPointAnnotation()
          annotation.title = "from swiftbook.ru"
          annotation.subtitle = self.textField.text!
          annotation.coordinate = placemark.location!.coordinate
          
          self.mapView.showAnnotations([annotation], animated: true)
          self.mapView.selectAnnotation(annotation, animated: true)
          
        }
      }
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

