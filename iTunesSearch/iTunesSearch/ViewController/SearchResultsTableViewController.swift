//
//  SearchResultsTableViewController.swift
//  iTunesSearch
//
//  Created by Marlon Raskin on 6/18/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

import UIKit

class SearchResultsTableViewController: UITableViewController {
	
	// MARK: - Properties
	
	@IBOutlet var segControl: UISegmentedControl!
	@IBOutlet var searchBar: UISearchBar!
	
	let searchResultsController = SearchResultController()
	
	// MARK: - Lifecycle
	
    override func viewDidLoad() {
        super.viewDidLoad()
		searchBar.delegate = self
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return searchResultsController.searchResults.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultCell", for: indexPath)
		let searchResultObject = searchResultsController.searchResults[indexPath.row]
		cell.textLabel?.text = searchResultObject.title
		cell.detailTextLabel?.text = searchResultObject.creator
	
        return cell
    }
}

extension SearchResultsTableViewController: UISearchBarDelegate {
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		guard let searchTerm = searchBar.text else { return }
		var resultType: ResultType!
		switch segControl.selectedSegmentIndex {
		case 0:
			resultType = .software
		case 1:
			resultType = .musicTrack
		case 2:
			resultType = .movie
		default:
			resultType = .movie
		}
		
		searchResultsController.performSearch(searchTerm: searchTerm, resultType: resultType) { (error) in
			DispatchQueue.main.async {
				self.tableView.reloadData()
			}
		}
	}
}
