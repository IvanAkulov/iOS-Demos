//
//  ViewController.swift
//  PDFReaderApp
//
//  Created by Alexey Efimov on 03/12/2018.
//  Copyright © 2018 Alexey Efimov. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    private var docs = ["Doc One", "Doc Two", "Doc Three"]
    private var fileName = ""
    
    // MARK: Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return docs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = docs[indexPath.row]
        
        return cell
    }
    
    // MARK: Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        fileName = docs[indexPath.row]
        performSegue(withIdentifier: "showDoc", sender: self)
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let pdfVC = segue.destination as! PDFViewController
        pdfVC.title = fileName
    }

}

