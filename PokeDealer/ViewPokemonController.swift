//
//  ViewPokemonController.swift
//  PokeDealer
//
//  Created by Robert Snyder on 7/15/16.
//  Copyright © 2016 Matthew Mitchell. All rights reserved.
//

import UIKit
import CoreData


class ViewPokemonController: UITableViewController  {
	
	
	
	@IBOutlet var pokemonList: UITableView!
	@IBOutlet weak var countLabel: UILabel!
	var count = 0
	var delegate: ViewCityControllerDelegate?
	var pokemons: [String] = []
	var missions = [PlayerPokemon]()
	override func tableView(sender: UITableView, numberOfRowsInSection: Int) -> Int {
		return missions.count
	}
	
	override func viewDidLoad()
	{

		super.viewDidLoad()
		tableView.dataSource = self
		tableView.delegate = self
		//countLabel.text = String(count)
		let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
//		let player = NSEntityDescription.insertNewObjectForEntityForName("PlayerGold", inManagedObjectContext: managedObjectContext) as! PlayerDetails
//		let playerPokemon = NSEntityDescription.insertNewObjectForEntityForName("PlayerPokemon", inManagedObjectContext: managedObjectContext) as! PlayerPokemon
		// Create Save Button
		let pokemonRequest = NSFetchRequest(entityName: "PlayerPokemon")
		let playerRequest = NSFetchRequest(entityName: "PlayerDetails")
		let userRequest = NSFetchRequest(entityName: "PlayerPokemon")
		do {
			let results = try managedObjectContext.executeFetchRequest(userRequest)
			missions = results as! [PlayerPokemon]
			for mission in missions {
				print(mission.dexNumb)
			}
			tableView.reloadData()
		} catch {
			print("\(error)")
		}
//		for pokes in pokemonRequest {
//			pokemons.append(String(playerPokemon))
//		}
		do {
			// get the results by executing the fetch request we made earlier
			let results = try managedObjectContext.executeFetchRequest(pokemonRequest)
			// downcast the results as an array of Mission objects
			let pokeIndexes = results as? [PlayerPokemon.Type]
			// print the details of each mission
			print(pokeIndexes)
//			for indexes in pokeIndexes! {
//				print("\(indexes.dexNumb)")
//			}
		} catch {
			// print the error if it is caught (Swift automatically saves the error in "error")
			print("\(error)")
		}
		// Remove Back Button
		//navigationItem.hidesBackButton = true
	}
	//===
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("pokeRow")!
		APICalls.getPokemonFromServer(Int(missions[indexPath.row].dexNumb!)) { (pokemon) in
			cell.textLabel?.text = pokemon.name
            cell.detailTextLabel?.text = String(pokemon.id)
            if let url = NSURL(string: pokemon.image){
                if let data = NSData(contentsOfURL: url){
                    cell.imageView?.image = UIImage(data: data)
                }
            }
		}
//		cell.textLabel?.text = String(missions[indexPath.row].dexNumb!)
//		cell.detailTextLabel?.text = String(indexPath.row + 1)
		print(cell)
		return cell
	}
	
	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		print("Section: \(indexPath.section) and Row: \(indexPath.row)")
//		pokemons.removeAtIndex(indexPath.row)
		tableView.reloadData()
	}
	//===
	
	@IBAction func countButtonClicked(sender: UIButton)
	{
		count += 1
		countLabel.text = String(count)
	}
	
	func save()
	{
		// Send Information Back to Delegate
		delegate?.saveCount(count)
		// Pop Top View (self)
		navigationController?.popViewControllerAnimated(true)
	}
}

//-----------------------------------------------------------------