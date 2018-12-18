//
//  MainTableViewController.swift
//  UISearchController
//
//  Created by Alexey Efimov on 17/12/2018.
//  Copyright © 2018 Alexey Efimov. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    let restaurants = [
        Restaurant(name: "Балкан Гриль", type: .restaurant),
        Restaurant(name: "Бочка", type: .bar),
        Restaurant(name: "Вкусные истории", type: .restaurant),
        Restaurant(name: "Дастархан", type: .fastfood),
        Restaurant(name: "Индокитай", type: .fastfood),
        Restaurant(name: "Классик", type: .restaurant),
        Restaurant(name: "Шок", type: .bar),
        Restaurant(name: "Bonsai", type: .restaurant),
        Restaurant(name: "Burger Heroes", type: .fastfood),
        Restaurant(name: "Kitchen", type: .restaurant),
        Restaurant(name: "Love&Life", type: .restaurant),
        Restaurant(name: "Morris Pub", type: .bar),
        Restaurant(name: "Speak Easy", type: .restaurant),
        Restaurant(name: "X.O", type: .bar)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let restaurant = restaurants[indexPath.row]

        cell.textLabel?.text = restaurant.name
        cell.detailTextLabel?.text = restaurant.type.rawValue

        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let detailVC = segue.destination as! DetailViewController
                detailVC.restaurant = restaurants[indexPath.row]
            }
        }
    }

}
