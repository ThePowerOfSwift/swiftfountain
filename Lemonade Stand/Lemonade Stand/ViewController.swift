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
	let kSixth:CGFloat = 1/6
	let kFourth:CGFloat = 1/4
	let kThird:CGFloat = 1/3
	let kHalf:CGFloat = 1/2
	
	//first container: labels
	var youHaveLabel: UILabel!
	var bank: UILabel!
	var lemonInv: UILabel!
	var iceInv: UILabel!
	
	//second container: labels
	var step1Label: UILabel!
	var lemPriceLabel: UILabel!
	var icePriceLabel: UILabel!
	var buyLemLabel: UILabel!
	var buyIceLabel: UILabel!
	
	//second container: buttons
	var moarLemsButton: UIButton!
	var lessLemsButton: UIButton!
	var moarIceButton: UIButton!
	var lessIceButton: UIButton!
	
	//misc
	var blackBorder:CGColor = UIColor.blackColor().CGColor
	
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
		var x = self.view.bounds.origin.x
		var y = self.view.bounds.origin.y
		var width = self.view.bounds.width
		var height = self.view.bounds.height * kFourth
		
		inventory = UIView(frame: CGRectMake(x, y, width, height))
		supplies = UIView(frame: CGRectMake(x, inventory.frame.height, width, height))
		mix = UIView(frame: CGRectMake(x, inventory.frame.height + supplies.frame.height, width, height))
		startSelling = UIView(frame: CGRectMake(x, inventory.frame.height + supplies.frame.height + mix.frame.height, width, height))

//		inventory.backgroundColor = UIColor.grayColor()
		supplies.backgroundColor = UIColor.grayColor()
//		mix.backgroundColor = UIColor.grayColor()
//		startSelling.backgroundColor = UIColor.redColor()
		
		self.view.addSubview(inventory)
		self.view.addSubview(supplies)
//		self.view.addSubview(mix)
//		self.view.addSubview(startSelling)
	}
	
	func firstContainer(cont: UIView) {
		var x:CGFloat = cont.frame.origin.x + 20
		var y:CGFloat = cont.frame.origin.y + 30
		var width = self.view.bounds.width * kHalf
		var height = self.view.bounds.height
		
		youHaveLabel = UILabel(frame: CGRectMake(x, y, width, height * kThird))
		youHaveLabel.text = "You have:"
		youHaveLabel.textColor = UIColor.redColor()
		youHaveLabel.font = UIFont(name: "MarkerFeld-Wide", size: 20)
		youHaveLabel.sizeToFit()

		bank = UILabel(frame: CGRectMake(width, y, width, height))
		bank.text = "$10"
		bank.textColor = UIColor.greenColor()
		bank.font = UIFont(name: "MarkerFeld-Wide", size: 20)
		bank.sizeToFit()
		
		lemonInv = UILabel(frame: CGRectMake(width, y + cont.bounds.height * kThird, width, height))
		lemonInv.text = "1 Lemons"
		lemonInv.textColor = UIColor.blackColor()
		lemonInv.font = UIFont(name: "MarkerFeld-Wide", size: 20)
		lemonInv.sizeToFit()
		
		iceInv = UILabel(frame: CGRectMake(width, y + cont.bounds.height * 2 * kThird, width, height))
		iceInv.text = "1 Ice Cubes"
		iceInv.textColor = UIColor.blackColor()
		iceInv.font = UIFont(name: "MarkerFeld-Wide", size: 20)
		iceInv.sizeToFit()
		
		cont.addSubview(youHaveLabel)
		cont.addSubview(bank)
		cont.addSubview(lemonInv)
		cont.addSubview(iceInv)
	}
	
	func secondContainer(cont: UIView) {
		var x:CGFloat = cont.bounds.origin.x
		var y:CGFloat = cont.bounds.origin.y
		var width:CGFloat = cont.bounds.width
		var height:CGFloat = cont.bounds.height

		step1Label = UILabel(frame: CGRectMake(x, y, width, height))
		step1Label.text = "Step 1: Purchase Supplies"
		step1Label.textColor = UIColor.purpleColor()
		step1Label.font = UIFont(name: "MarkerFeld-Wide", size: 20)
		step1Label.sizeToFit()
		
		lemPriceLabel = UILabel(frame: CGRectMake(x, y + height * kThird, width * kHalf, height * kThird))
		lemPriceLabel.text = "Lemons for $2:"
		lemPriceLabel.textColor = UIColor.blackColor()
		lemPriceLabel.textAlignment = NSTextAlignment.Right
		lemPriceLabel.font = UIFont(name: "MarkerFeld-Wide", size: 20)
		
		icePriceLabel = UILabel(frame: CGRectMake(x, y + height * 2 * kThird, width * kHalf, height * kThird))
		icePriceLabel.text = "Ice Cubes for $1:"
		icePriceLabel.textColor = UIColor.blackColor()
		icePriceLabel.textAlignment = NSTextAlignment.Right
		icePriceLabel.font = UIFont(name: "MarkerFeld-Wide", size: 20)
		
		buyLemLabel = UILabel(frame: CGRectMake(x + width * 4 * kSixth, y + height * kThird, width * kSixth, height * kThird))
		buyLemLabel.text = "0"
		buyLemLabel.textColor = UIColor.blackColor()
		buyLemLabel.textAlignment = NSTextAlignment.Center
		buyLemLabel.font = UIFont(name: "MarkerFeld-Wide", size: 20)

		buyIceLabel = UILabel(frame: CGRectMake(x + width * 4 * kSixth, y + height * 2 * kThird, width * kSixth, height * kThird))
		buyIceLabel.text = "0"
		buyIceLabel.textColor = UIColor.blackColor()
		buyIceLabel.textAlignment = NSTextAlignment.Center
		buyIceLabel.font = UIFont(name: "MarkerFeld-Wide", size: 20)
		
		
		moarIceButton = UIButton()
		lessLemsButton = UIButton()
		lessIceButton = UIButton()
		
		moarLemsButton = UIButton(frame: CGRectMake(x + width * 3 * kSixth, y + height * kThird, width * kSixth, height * kThird))
		moarLemsButton.setTitle("+", forState: UIControlState.Normal)
		moarLemsButton.setTitleColor(UIColor.purpleColor(), forState: UIControlState.Normal)
		moarLemsButton.titleLabel?.font = UIFont(name: "MarkerFeld-Wide", size: 20)
		moarLemsButton.center = CGPointMake(x + width * 3 * kSixth, y + height * kThird)
		moarLemsButton.addTarget(self, action: "addLemsPressed:", forControlEvents: UIControlEvents.TouchUpInside)

		moarLemsButton.layer.borderColor = blackBorder
		moarLemsButton.layer.borderWidth = 2
		
		cont.addSubview(step1Label)
		cont.addSubview(lemPriceLabel)
		cont.addSubview(icePriceLabel)
		cont.addSubview(buyLemLabel)
		cont.addSubview(buyIceLabel)
		
		cont.addSubview(moarLemsButton)
//		cont.addSubview(moarIceButton)
//		cont.addSubview(lessLemsButton)
//		cont.addSubview(lessIceButton)
	}
	
	func thirdContainer(cont: UIView) {
		
	}
	
	func fourthContainer(cont: UIView) {
		
	}

	func addLemsPressed(button: UIButton) {
		buyLemLabel.text = "1"
	}









}










