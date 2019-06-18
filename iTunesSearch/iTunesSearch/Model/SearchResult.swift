//
//  SearchResult.swift
//  iTunesSearch
//
//  Created by Marlon Raskin on 6/18/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

import Foundation


struct SearchResult: Codable {
	var title: String?
	var creator: String?
	
	enum CodingKeys: String, CodingKey {
		case title = "trackName"
		case creator = "artistName"
	}
}

struct SearchResults: Decodable {
	let results: [SearchResult]
}
