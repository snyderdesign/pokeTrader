//
//  ViewController.swift
//  PokeDealer
//
//  Created by Matthew Mitchell on 7/15/16.
//  Copyright © 2016 Matthew Mitchell. All rights reserved.
//

import UIKit
import CoreData

class ViewMapController: UIViewController, ViewCityControllerDelegate {

	@IBOutlet weak var pickerView: UIPickerView!
	@IBOutlet weak var mapImage: UIImageView!
	var cityNumb = 0
    override func viewDidLoad() {
        super.viewDidLoad()
		//mapImage.image = UIImage (named: "map.png")
		let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
		let player = NSEntityDescription.insertNewObjectForEntityForName("PlayerDetails", inManagedObjectContext: managedObjectContext) as! PlayerDetails
		let playerPokemon = NSEntityDescription.insertNewObjectForEntityForName("PlayerPokemon", inManagedObjectContext: managedObjectContext) as! PlayerPokemon

		
        // Do any additional setup after loading the view, typically from a nib.
		player.yourGold = 0
		playerPokemon.dexNumb = 1
		print(player.yourGold)
		
    }
	//-------------cities code------------
	var cities = ["Pallet Town", "Viridian City", "Pewter City", "Cerulean City", "Vermillion City", "Lavendar Town", "Fuchisa City", "Saffron City", "Cinnabar Island", "Camp Pokéhearst", "Chrysanthemum Island", "Commerce City", "Dark City", "Gardenia Town", "Hidden Village", "HopHopHop Town", "Pokélantis", "Sable City"  ]
	
	func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
		return 1
	}
	
	func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return cities.count
	}
	func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
		return cities[row]
	}
	//-------------------------
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
	{
		if !(sender!.tag == 99) {
			// Send Information To View C Before Making Segue
			let destination = segue.destinationViewController as! ViewCityController
			destination.delegate = self
			destination.cityNumb = cityNumb
		}
	} //saveCount(cityNumb: Int)

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	@IBAction func cityButtons(sender: UIButton) {
		cityNumb = sender.tag
	}
	func saveCount(cityNumb: Int)
	{
		// This function is Called By View C Controller
		self.cityNumb = cityNumb
	}


}

