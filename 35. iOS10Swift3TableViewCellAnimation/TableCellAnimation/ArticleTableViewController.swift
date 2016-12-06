//
//  ArticleTableViewController.swift
//  TableCellAnimation
//
//  Created by Simon Ng on 18/11/14.
//  Copyright (c) 2014 AppCoda. All rights reserved.
//

import UIKit

class ArticleTableViewController: UITableViewController {
  
  let array = ["Курс 0: Основы программирования",
                    "Курс 1: Гид по языку программирования Swift",
                    "Курс 2: Разработка приложения на основе UITableView",
                    "Курс 3: Разработка игр на движке SpriteKit",
                    "Курс 4: Встроенные покупки (in-app purchases)",
                    "Курс 5: Core Data. Часть 1",
                    "Курс 6: Разработка мессенджера на основе parse.com",
                    "Курс 7: Калькулятор",
                    "Курс 8: Grand Central Dispatch",
                    "Курс 9: Application Programming Interface"
                    ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    // Return the number of sections.
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // Return the number of rows in the section.
    
    return array.count
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
    return 100
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    
    // Configure the cell...
    cell.textLabel!.text = array[indexPath.row]
    
    cell.alpha = 0
    // Define the final state (After the animation)
    UIView.animate(withDuration: 1.0, animations: { cell.alpha = 1 })
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    // Define the initial state (Before the animation)
//    
//    let rotationAngle = 90 * CGFloat(M_PI / 180)
//    let rotationTransform = CATransform3DMakeRotation(rotationAngle, 0, 1, 0)
//    cell.layer.transform = rotationTransform
//    
//    UIView.animate(withDuration: 1, animations: {
//      cell.layer.transform = CATransform3DIdentity
//    })
    
    let degrees: Double = 90
    let rotationAngle = CGFloat(degrees * M_PI / 180)
    let transformRotation = CATransform3DMakeRotation(rotationAngle, 0, 1, 0)
    cell.layer.transform = transformRotation
    
    UIView.animate(withDuration: 0.4, delay: 0.1 * Double(indexPath.row), options: .curveEaseInOut, animations: {
      cell.layer.transform = CATransform3DIdentity
    })
    
//    let translate = CATransform3DTranslate(CATransform3DIdentity, -500, 400, 0)
//    cell.layer.transform = translate
//    // Define the final state (After the animation)
//    let delayFirst: Double = 1
//    let delay = indexPath.row == 0 ? delayFirst : delayFirst + 0.2 * Double(indexPath.row)
//    UIView.animate(withDuration: 0.4, delay: delay, options: .curveEaseInOut, animations: {
//      cell.layer.transform = CATransform3DIdentity
//    })
  }
}
