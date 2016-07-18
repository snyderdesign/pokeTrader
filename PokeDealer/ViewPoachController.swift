//
//  ViewPoachController.swift
//  PokeDealer
//
//  Created by Robert Snyder on 7/15/16.
//  Copyright © 2016 Matthew Mitchell. All rights reserved.
//

import UIKit
import CoreData


class ViewPoachController: UIViewController {
	
	
	@IBOutlet weak var poachLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pokeImage: UIImageView!
	
	var cityNumb = 0
	var delegate: ViewCityControllerDelegate?
	
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
        nameLabel.hidden = true
		let tempNumber = randomPokemon()
		poachLabel.text = displayPokemon(tempNumber)
//        getPokemon(tempNumber)
        APICalls.getPokemonFromServer(tempNumber) { (pokemon) in
            self.nameLabel.text = pokemon.name
            self.nameLabel.hidden = false
            if let url = NSURL(string: pokemon.image) {
                if let data = NSData(contentsOfURL: url) {
                    self.pokeImage.image = UIImage(data: data)
                }
            }//close if
        }//close api call
	}
	//====
	

	//====
    
//    func getPokemon(pokeNum: Int) {
//        APICalls.getPokemonFromServer(pokeNum) { (pokemon) in
//            self.nameLabel.text = pokemon.name
//            self.nameLabel.hidden = false
//            if let url = NSURL(string: pokemon.image) {
//                if let data = NSData(contentsOfURL: url) {
//                    self.pokeImage.image = UIImage(data: data)
//                }
//            }//close if
//        }//close api call
//    }
	
	func randomPokemon() -> Int {
		let tempPoke = Int(arc4random_uniform(150)+1)
		
		return tempPoke
	}
	func displayPokemon(number: Int) -> String {
		let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
		let mission = NSEntityDescription.insertNewObjectForEntityForName("PlayerPokemon", inManagedObjectContext: managedObjectContext) as! PlayerPokemon
		mission.dexNumb = number
		if managedObjectContext.hasChanges {
			do {
				try managedObjectContext.save()
				print("Success")
			} catch {
				print("\(error)")
			}
		}
		return String(number)
	}
}