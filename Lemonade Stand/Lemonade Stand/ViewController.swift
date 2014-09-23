//
//  ViewController.swift
//  Lemonade Stand
//
//  Created by Stanley Chiang on 9/22/14.
//  Copyright (c) 2014 Stanley Chiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	//containers
	var inventory: UIView!
	var supplies: UIView!
	var mix: UIView!
	var startSelling: UIView!
	
	//constants
	let kViewMargin:CGFloat = 10.0
	let kFourth:CGFloat = 1/4
	let kThird:CGFloat = 1/3
	let kHalf:CGFloat = 1/2
	
	//first container: labels
	var youHaveLabel: UILabel!
	var bank: UILabel!
	var lemonInv: UILabel!
	var iceInv: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		setupContainerViews()
		firstContainer(inventory)
		secondContainer(supplies)
		thirdContainer(mix)
		fourthContainer(startSelling)
	
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func setupContainerViews() {
		var x = self.view.bounds.origin.x + kViewMargin
		var y = self.view.bounds.origin.y
		var width = self.view.bounds.width - kViewMargin * 2
		var height = self.view.bounds.height * kFourth
		
		inventory = UIView(frame: CGRectMake(x, y, width, height))
		supplies = UIView(frame: CGRectMake(x, inventory.frame.height, width, height))
		mix = UIView(frame: CGRectMake(x, inventory.frame.height + supplies.frame.height, width, height))
		startSelling = UIView(frame: CGRectMake(x, inventory.frame.height + supplies.frame.height + mix.frame.height, width, height))

		inventory.backgroundColor = UIColor.grayColor()
		supplies.backgroundColor = UIColor.greenColor()
		mix.backgroundColor = UIColor.grayColor()
		startSelling.backgroundColor = UIColor.redColor()
		
		self.view.addSubview(inventory)
		self.view.addSubview(supplies)
		self.view.addSubview(mix)
		self.view.addSubview(startSelling)
	}
	
	func firstContainer(cont: UIView) {
		var x:CGFloat = 20
		var y:CGFloat = 30
		var width = self.view.bounds.width * kHalf
		var height = self.view.bounds.height
		
		youHaveLabel = UILabel(frame: CGRectMake(x, y, width, height))
		youHaveLabel.text = "You have:"
		youHaveLabel.textColor = UIColor.redColor()
		youHaveLabel.font = UIFont(name: "MarkerFeld-Wide", size: 20)
		youHaveLabel.sizeToFit()

		bank = UILabel()
		bank.text = "$10"
		bank.textColor = UIColor.greenColor()
		bank.font = UIFont(name: "MarkerFeld-Wide", size: 20)
		bank.sizeToFit()
		
		lemonInv = UILabel()
		lemonInv.text = "1 Lemons"
		lemonInv.textColor = UIColor.blackColor()
		lemonInv.font = UIFont(name: "MarkerFeld-Wide", size: 20)
		lemonInv.sizeToFit()
		
		iceInv = UILabel()
		iceInv.text = "1 Ice Cubes"
		iceInv.textColor = UIColor.blackColor()
		iceInv.font = UIFont(name: "MarkerFeld-Wide", size: 20)
		iceInv.sizeToFit()
		
		cont.addSubview(youHaveLabel)
//		cont.addSubview(bank)
//		cont.addSubview(lemonInv)
//		cont.addSubview(iceInv)
	}
	
	func secondContainer(cont: UIView) {
		
	}
	
	func thirdContainer(cont: UIView) {
		
	}
	
	func fourthContainer(cont: UIView) {
		
	}
}