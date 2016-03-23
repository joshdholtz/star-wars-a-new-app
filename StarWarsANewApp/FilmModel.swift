//
//  FilmModel.swift
//  StarWarsANewApp
//
//  Created by Josh Holtz on 3/23/16.
//  Copyright © 2016 RokkinCat. All rights reserved.
//

import Foundation

import ObjectMapper

struct FilmModel: Mappable {
	var title: String?
	
	init?(_ map: Map) {
		
	}
	
	mutating func mapping(map: Map) {
		title <- map["title"]
	}
}