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
	
	var cityNumb = 0
	var delegate: ViewCityControllerDelegate?
	
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
		let tempNumber = randomPokemon()
		poachLabel.text = displayPokemon(tempNumber)
	}
	//====
	

	//====
	
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