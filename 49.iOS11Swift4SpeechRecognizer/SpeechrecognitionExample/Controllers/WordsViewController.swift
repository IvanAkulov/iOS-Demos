//
//  WordsViewController.swift
//  SpeechrecognitionExample
//
//  Created by Kostya Golenkov on 18.11.17.
//  Copyright © 2017 Kostya Golenkov. All rights reserved.
//

import UIKit

class WordsViewController: UITableViewController {
    
    let cellId = "Cell"
    let segueId = "showWordSegue"
    let words = [("hello", "heˈlō,həˈlō"),
                 ("think", "THiNGk"),
                 ("chemistry", "ˈkeməstrē"),
                 ("whole", "hōl")]
    
    var selectedWord = ("","")
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK: - Table view
extension WordsViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = words[indexPath.row].0
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedWord = words[indexPath.row]
        performSegue(withIdentifier: segueId, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destVC = segue.destination as? WordViewController {
            destVC.word = selectedWord
        }
    }
}
