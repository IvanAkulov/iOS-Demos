//
//  TableViewController.swift
//  ReadFromFile
//
//  Created by Ivan Akulov on 28/12/2016.
//  Copyright © 2016 Ivan Akulov. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var textArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        readFromFile()
        
    }
    
    func readFromFile() {
        if let path = Bundle.main.path(forResource: "text", ofType: "txt") {
            if let text = try? String(contentsOfFile: path) {
                textArray = text.components(separatedBy: "\n\n")
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return textArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = "Cell number \(indexPath.row)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let dvc = segue.destination as! ViewController
                dvc.text = textArray[indexPath.row]
            }
        }
    }
    
}











