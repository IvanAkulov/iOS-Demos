//
//  TableViewController.swift
//  SpellChecker
//
//  Created by Ivan Akulov on 28/02/16.
//  Copyright © 2016 Ivan Akulov. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
  
  let wordVariations = ["магозин", "могозин", "магазин", "магазен"]

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

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return wordVariations.count
    }

  
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
      
      cell.textLabel?.text = wordVariations[indexPath.row]
      cell.textLabel?.backgroundColor = UIColor.clearColor()

        // Configure the cell...

        return cell
    }
  
  
  func ifWordCorrect(word: String) -> Bool {
    let textChecker = UITextChecker()
    
    let checkRange = NSMakeRange(0, word.characters.count)
    
    let stringRange = textChecker.rangeOfMisspelledWordInString(word, range: checkRange, startingAt: 0, wrap: false, language: "ru")
    
    return stringRange.location == NSNotFound
    
  }
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let cell = tableView.cellForRowAtIndexPath(indexPath)!
    
    if ifWordCorrect((cell.textLabel?.text)!) {
      cell.backgroundColor = UIColor.greenColor()
    } else {
      cell.backgroundColor = UIColor.redColor()
    }
    
    tableView.reloadData()
  }
}
