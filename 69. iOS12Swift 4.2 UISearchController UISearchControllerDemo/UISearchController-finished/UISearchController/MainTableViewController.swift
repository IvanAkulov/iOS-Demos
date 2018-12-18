//
//  MainTableViewController.swift
//  UISearchController
//
//  Created by Alexey Efimov on 17/12/2018.
//  Copyright © 2018 Alexey Efimov. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    private let restaurants = [
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
    private var filteredRestaurants = [Restaurant]()
    private let searchController = UISearchController(searchResultsController: nil)
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredRestaurants.count
        }
        return restaurants.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        var restaurant: Restaurant
        
        if isFiltering {
            restaurant = filteredRestaurants[indexPath.row]
        } else {
            restaurant = restaurants[indexPath.row]
        }

        cell.textLabel?.text = restaurant.name
        cell.detailTextLabel?.text = restaurant.type.rawValue

        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let restaurant: Restaurant
                if isFiltering {
                    restaurant = filteredRestaurants[indexPath.row]
                } else {
                    restaurant = restaurants[indexPath.row]
                }
                let detailVC = segue.destination as! DetailViewController
                detailVC.restaurant = restaurant
            }
        }
    }

}

// MARK: - UISearchResultsUpdating Delegate
extension MainTableViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        
        filteredRestaurants = restaurants.filter({ (restaurant: Restaurant) -> Bool in
            return restaurant.name.lowercased().contains(searchText.lowercased())
        })
        
        tableView.reloadData()
    }
}

