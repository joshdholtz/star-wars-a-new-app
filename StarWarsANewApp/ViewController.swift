//
//  ViewController.swift
//  StarWarsANewApp
//
//  Created by Josh Holtz on 3/23/16.
//  Copyright © 2016 RokkinCat. All rights reserved.
//

import UIKit

import Alamofire
import ObjectMapper

class ViewController: UITableViewController {
	
	var films: [FilmModel]?

	override func viewDidLoad() {
		super.viewDidLoad()
		
		let getFilms = GetFilms()
		getFilms.request { (object) -> () in
			
		}
		
		Film.Films.request { [weak self] (object) -> () in
			guard let object = object as? [String: AnyObject] else {
				return
			}
			let results = object["results"]
			self?.films = Mapper<FilmModel>().mapArray(results)
			self?.tableView.reloadData()
		}
		
		
	}

	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return films?.count ?? 0
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		
		guard let cell = tableView.dequeueReusableCellWithIdentifier("FilmCell", forIndexPath: indexPath) as? FilmCell else {
			fatalError("THIS SHOULD NEVER HAPPEN")
		}
		
		let film = films?[indexPath.row]
		
		cell.lblTitle.text = film?.title ?? "no title dude"
		return cell
	}

}

