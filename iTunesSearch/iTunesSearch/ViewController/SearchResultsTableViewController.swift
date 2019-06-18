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
	
	let searchResultsController = SearchResultController()

	// MARK: - Lifecycle
	
    override func viewDidLoad() {
        super.viewDidLoad()
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
