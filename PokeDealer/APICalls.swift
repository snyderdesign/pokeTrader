//
//  APICalls.swift
//  pokemonAPICalls
//
//  Created by Maxim Rose on 7/15/16.
//  Copyright © 2016 Maxim Rose. All rights reserved.
//

import Foundation

class APICalls{
	
	func exampleFunction () {
		APICalls.getPokemonFromServer(26) { (pokemon) in
			print(pokemon.name)
		}
	}
	
	static func getPokemonFromServer(id: Int, receivedPokemon: (pokemon: Pokemon) -> ()) {
		
		let url = NSURL(string: "https://pokeapi.co/api/v2/pokemon/\(id)")
		let session = NSURLSession.sharedSession()
		let task = session.dataTaskWithURL(url!, completionHandler: ({
			data, response, error in
			
			do {
				let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)
				
				let dictionary = json as! NSDictionary
				let pokemon = Pokemon(dictionary: dictionary)
				receivedPokemon(pokemon: pokemon)
				
			} catch {
				print("Failed To Convert Data")
			}
			
		}))
		task.resume()
	}
	
	static func getPokemonFromServer(strt: Int, end: Int, recievedPokemon: (pokemon: [Pokemon]) -> ()){
		var pokemons: [Pokemon] = []
		for id in strt...end{
			let url = NSURL(string: "https://pokeapi.co/api/v2/pokemon/\(id)")
			let session = NSURLSession.sharedSession()
			let task = session.dataTaskWithURL(url!, completionHandler: ({
				data, response, error in
				
				do {
					let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)
					
					let dictionary = json as! NSDictionary
					let pokemon = Pokemon(dictionary: dictionary)
					pokemons.append(pokemon)
					recievedPokemon(pokemon: pokemons)
					
					//                    self.tableView.reloadData()
				} catch {
					print("Failed To Convert Data")
				}
				
			}))
			task.resume()
		}
	}
}