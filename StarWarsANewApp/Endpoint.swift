//
//  Endpoint.swift
//  StarWarsANewApp
//
//  Created by Josh Holtz on 3/23/16.
//  Copyright © 2016 RokkinCat. All rights reserved.
//

import Foundation

import Alamofire

private let base = "http://swapi.co/api"

protocol Endpoint {
	var method: Alamofire.Method { get }
	var route: String { get }
}

extension Endpoint {
	func request(handler: (object: AnyObject?) -> ()) {
		Alamofire.request(method, "\(base)\(route)").responseJSON { (response) -> Void in
			handler(object: response.result.value)
		}
	}
}

class GetFilms: Endpoint {
	var method = Alamofire.Method.GET
	var route = "asdfdsa"
}

enum Film: Endpoint {
	case Films
	case Film(Int)
	
	var method: Alamofire.Method {
		switch self {
		case Films: return .GET
		case Film: return .GET
		}
	}
	
	var route: String {
		switch self {
		case Films: return "/films/"
		case let Film(id): return "/films/\(id)/"
		}
	}
}

enum People: Endpoint {
	case People
	case Person(Int)
	
	var method: Alamofire.Method {
		switch self {
		case People: return .GET
		case Person: return .GET
		}
	}
	
	var route: String {
		switch self {
		case People: return "/people/"
		case let Person(id): return "/people/\(id)/"
		}
	}
}