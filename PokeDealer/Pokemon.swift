//
//  Pokemon.swift
//  pokemonAPICalls
//
//  Created by Maxim Rose on 7/15/16.
//  Copyright © 2016 Maxim Rose. All rights reserved.
//

import Foundation

class Pokemon {
	
	var id: Int
	var name: String
	var types: [String] = []
	var image: String
	
	init(dictionary: NSDictionary){
		id  = dictionary.valueForKey("id") as! Int
		name  = dictionary.valueForKey("name") as! String
		
		//since types contains an array with two more json objects we extract
		//the object that we want that contains the type. Then within the type opbject
		//is another key value pair for the name of the type which is then extracted
		//and appended to the array of types since some pokemon have two types
		let arrTypes = dictionary.valueForKey("types") as! NSArray
		for group in arrTypes {
			let obj = group as! NSDictionary
			let temp = obj.valueForKey("type") as! NSDictionary
			self.types.append(temp.valueForKey("name") as! String)
		}
		image = "https://pokeapi.co/media/sprites/pokemon/\(id).png"
	}
}