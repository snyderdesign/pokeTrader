//
//  ViewController.swift
//  PokeDealer
//
//  Created by Matthew Mitchell on 7/15/16.
//  Copyright © 2016 Matthew Mitchell. All rights reserved.
//

import UIKit
import CoreData

protocol ViewCityControllerDelegate
{
	func saveCount(cityNumb: Int)
}

class ViewCityController: UITableViewController {
	

	@IBOutlet weak var countLabel: UILabel!
	@IBOutlet weak var cityTitle: UINavigationItem!
	
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
	var cityNumb = 0
	var delegate: ViewCityControllerDelegate?
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
		cityTitle.title = String(cities[cityNumb])
	}
	
}

//import UIKit
//
//protocol ViewCControllerDelegate
//{
//	func saveCount(count: Int)
//}
//
//class ViewCController: UIViewController
//{
//	@IBOutlet weak var countLabel: UILabel!
//	var count = 0
//	var delegate: ViewCControllerDelegate?
//	
//	override func viewDidLoad()
//	{
//		super.viewDidLoad()
//		countLabel.text = String(count)
//		
//		// Create Save Button
//		let barButton = UIBarButtonItem(barButtonSystemItem: .Save, target: self, action: #selector(ViewCController.save))
//		navigationItem.setRightBarButtonItem(barButton, animated: true)
//		
//		// Remove Back Button
//		navigationItem.hidesBackButton = true
//	}
//	@IBAction func countButtonClicked(sender: UIButton)
//	{
//		count += 1
//		countLabel.text = String(count)
//	}
//	func save()
//	{
//		// Send Information Back to Delegate
//		delegate?.saveCount(count)
//		// Pop Top View (self)
//		navigationController?.popViewControllerAnimated(true)
//	}
//}