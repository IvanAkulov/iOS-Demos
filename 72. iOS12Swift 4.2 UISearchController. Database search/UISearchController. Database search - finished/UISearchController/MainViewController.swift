//
//  MainTableViewController.swift
//  UISearchController
//
//  Created by Alexey Efimov on 17/12/2018.
//  Copyright © 2018 Alexey Efimov. All rights reserved.
//

import UIKit
import RealmSwift

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var restaurants: Results<Restaurant>!
    private var filteredRestaurants: Results<Restaurant>!
    
    private let searchController = UISearchController(searchResultsController: nil)
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    private var isFiltering: Bool {
        let searchBarScopeIsFiltering = searchController.searchBar.selectedScopeButtonIndex != 0
        return searchController.isActive && (!searchBarIsEmpty || searchBarScopeIsFiltering)
    }

    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchFooter: SearchFooter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        restaurants = realm.objects(Restaurant.self)
        
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        // Setup the Scope Bar
        searchController.searchBar.scopeButtonTitles = ["All", "Restaurant", "Fastfood", "Bar"]
        searchController.searchBar.delegate = self
        
        // Setup the search footer
        tableView.tableFooterView = searchFooter
    }

    // MARK: - Table view data source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            searchFooter.setIsFilteringToShow(filteredItemCount: filteredRestaurants.count, of: restaurants.count)
            return filteredRestaurants.count
        }
        searchFooter.setNotFiltering()
        return restaurants.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        var restaurant: Restaurant
        
        if isFiltering {
            restaurant = filteredRestaurants[indexPath.row]
        } else {
            restaurant = restaurants[indexPath.row]
        }

        cell.textLabel?.text = restaurant.name
        cell.detailTextLabel?.text = restaurant.type?.name

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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
extension MainViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterContentForSearchText(searchController.searchBar.text!, scope: scope)
    }
    
    private func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        
        if scope == "All" {
            filteredRestaurants = restaurants.filter("name CONTAINS[c] '\(searchText)'")
        } else if searchBarIsEmpty {
            filteredRestaurants = restaurants.filter("type.name = '\(scope)'")
        } else {
            filteredRestaurants = restaurants.filter("name CONTAINS[c] '\(searchText)' AND type.name = '\(scope)'")
        }
        
        tableView.reloadData()
    }
}

// MARK: - UISearchBar Delegate
extension MainViewController: UISearchBarDelegate {
   
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}
