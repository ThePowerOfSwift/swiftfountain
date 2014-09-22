//
//  ViewController.swift
//  SlotMachine
//
//  Created by Stanley Chiang on 9/21/14.
//  Copyright (c) 2014 Stanley Chiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	//containers
	var firstContainer: UIView!
	var secondContainer: UIView!
	var thirdContainer: UIView!
	var fourthContainer: UIView!
	
	//first container labels
	var titleLabel: UILabel!
	
	//constants
	let kMarginForView:CGFloat = 10.0
	let kMarginForSlot:CGFloat = 2.0

	let kNumberOfRows = 3
	let kNumberOfCols = 3

	let kSixth:CGFloat = 1/6
	let kThird:CGFloat = 1/3
	let kHalf:CGFloat = 1/2
	let kEigth:CGFloat = 1/8
	
	//third container: information labels
	var creditsLabel: UILabel!
	var betLabel: UILabel!
	var winnerPaidLabel: UILabel!
	var creditsTitleLabel: UILabel!
	var betTitleLabel: UILabel!
	var winnerPaidTitleLabel: UILabel!
	
	//third container: money vars
	var credits:Int = 0
	var winnings:Int = 0
	var currentBet:Int = 0
	//fourth container: buttons
	var resetButton: UIButton!
	var betOneButton: UIButton!
	var betMaxButton: UIButton!
	var spinButton: UIButton!
	
	//function vars
	var slots:[[Slot]] = []
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		setupContainerViews()
		setupFirstContainer(firstContainer)
		setupSecondContainer(secondContainer)
		setupThirdContainer(thirdContainer)
		setupFourthContainer(fourthContainer)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func setupContainerViews() {
		var bounds = self.view.bounds
		var x = self.view.bounds.origin.x + kMarginForView
		var width = self.view.bounds.width - (kMarginForView * 2)
		var height = self.view.bounds.height * kSixth
		
		firstContainer = UIView(frame: CGRectMake(x, bounds.origin.y, width, height))
		secondContainer = UIView(frame: CGRectMake(x, firstContainer.frame.height, width, height * 3))
		thirdContainer = UIView(frame: CGRectMake(x, firstContainer.frame.height + secondContainer.frame.height, width, height))
		fourthContainer = UIView(frame: CGRectMake(x, firstContainer.frame.height + secondContainer.frame.height + thirdContainer.frame.height, width, height))
		
		firstContainer.backgroundColor = UIColor.redColor()
		secondContainer.backgroundColor = UIColor.blackColor()
		thirdContainer.backgroundColor = UIColor.grayColor()
		fourthContainer.backgroundColor = UIColor.blackColor()
		
		self.view.addSubview(firstContainer)
		self.view.addSubview(secondContainer)
		self.view.addSubview(thirdContainer)
		self.view.addSubview(fourthContainer)
	
	}

	func setupFirstContainer(containerView: UIView) {
		titleLabel = UILabel()
		titleLabel.text = "Super Slots"
		titleLabel.textColor = UIColor.yellowColor()
		titleLabel.font = UIFont(name: "MarkerFeld-Wide", size: 40)
		titleLabel.sizeToFit()
		titleLabel.center = containerView.center
		containerView.addSubview(titleLabel)
	}
	
	func setupSecondContainer(containerView: UIView){
		for var colNumber = 0; colNumber < kNumberOfCols; ++colNumber {
			for var rowNumber = 0; rowNumber < kNumberOfRows; ++rowNumber {
				var slotImageView = UIImageView()
				slotImageView.backgroundColor = UIColor.yellowColor()
				slotImageView.frame = CGRectMake(containerView.bounds.origin.x + (containerView.bounds.width * kThird * CGFloat(colNumber)),
												 containerView.bounds.origin.y + (containerView.bounds.height * kThird * CGFloat(rowNumber)),
												 containerView.bounds.width * kThird - kMarginForSlot,
												 containerView.bounds.height * kThird - kMarginForSlot)
				if slots.count != 0 {
					slotImageView.image = slots[colNumber][rowNumber].image
				} else {
					slotImageView.image = UIImage(named: "Ace")
				}
				
				
				containerView.addSubview(slotImageView)
				
			}
		}
	}
	
	func setupThirdContainer(containerView: UIView) {
		creditsLabel = UILabel()
		betLabel = UILabel()
		winnerPaidLabel = UILabel()
		
		creditsTitleLabel = UILabel()
		betTitleLabel = UILabel()
		winnerPaidTitleLabel = UILabel()
		
		creditsLabel.text = "000000"
		creditsLabel.textColor = UIColor.redColor()
		creditsLabel.font = UIFont(name: "Menlo-Bold", size: 16)
		creditsLabel.sizeToFit()
		creditsLabel.center = CGPointMake(containerView.frame.width * kSixth, containerView.frame.height * kThird)
		creditsLabel.textAlignment = NSTextAlignment.Center
		creditsLabel.backgroundColor = UIColor.darkGrayColor()

		betLabel.text = "000000"
		betLabel.textColor = UIColor.redColor()
		betLabel.font = UIFont(name: "Menlo-Bold", size: 16)
		betLabel.sizeToFit()
		betLabel.center = CGPointMake(containerView.frame.width * kSixth * 3, containerView.frame.height * kThird)
		betLabel.textAlignment = NSTextAlignment.Center
		betLabel.backgroundColor = UIColor.darkGrayColor()
		
		winnerPaidLabel.text = "000000"
		winnerPaidLabel.textColor = UIColor.redColor()
		winnerPaidLabel.font = UIFont(name: "Menlo-Bold", size: 16)
		winnerPaidLabel.sizeToFit()
		winnerPaidLabel.center = CGPointMake(containerView.frame.width * kSixth * 5, containerView.frame.height * kThird)
		winnerPaidLabel.textAlignment = NSTextAlignment.Center
		winnerPaidLabel.backgroundColor = UIColor.darkGrayColor()
		
		creditsTitleLabel.text = "Credits"
		creditsTitleLabel.textColor = UIColor.blackColor()
		creditsTitleLabel.font = UIFont(name: "AmericanTypewriter", size: 14)
		creditsTitleLabel.sizeToFit()
		creditsTitleLabel.center = CGPointMake(containerView.frame.width * kSixth, containerView.frame.height * kThird * 2)

		betTitleLabel.text = "Bet"
		betTitleLabel.textColor = UIColor.blackColor()
		betTitleLabel.font = UIFont(name: "AmericanTypewriter", size: 14)
		betTitleLabel.sizeToFit()
		betTitleLabel.center = CGPointMake(containerView.frame.width * kSixth * 3, containerView.frame.height * kThird * 2)
		
		winnerPaidTitleLabel.text = "Winner Paid"
		winnerPaidTitleLabel.textColor = UIColor.blackColor()
		winnerPaidTitleLabel.font = UIFont(name: "AmericanTypewriter", size: 14)
		winnerPaidTitleLabel.sizeToFit()
		winnerPaidTitleLabel.center = CGPointMake(containerView.frame.width * kSixth * 5, containerView.frame.height * kThird * 2)

		
		containerView.addSubview(creditsLabel)
		containerView.addSubview(betLabel)
		containerView.addSubview(winnerPaidLabel)
		
		containerView.addSubview(creditsTitleLabel)
		containerView.addSubview(betTitleLabel)
		containerView.addSubview(winnerPaidTitleLabel)
	}
	
	func setupFourthContainer(containerView: UIView) {
		resetButton = UIButton()
		betOneButton = UIButton()
		betMaxButton = UIButton()
		spinButton = UIButton()
		
		resetButton.setTitle("Reset", forState: UIControlState.Normal)
		resetButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
		resetButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)
		resetButton.backgroundColor = UIColor.lightGrayColor()
		resetButton.sizeToFit()
		resetButton.center = CGPointMake(containerView.frame.width * kEigth, containerView.frame.height * kHalf)
		resetButton.addTarget(self, action: "resetButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
	
		betOneButton.setTitle("Bet One", forState: UIControlState.Normal)
		betOneButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
		betOneButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)
		betOneButton.backgroundColor = UIColor.lightGrayColor()
		betOneButton.sizeToFit()
		betOneButton.center = CGPointMake(containerView.frame.width * kEigth * 3, containerView.frame.height * kHalf)
		betOneButton.addTarget(self, action: "betOneButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
		
		betMaxButton.setTitle("Bet Max", forState: UIControlState.Normal)
		betMaxButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
		betMaxButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)
		betMaxButton.backgroundColor = UIColor.redColor()
		betMaxButton.sizeToFit()
		betMaxButton.center = CGPointMake(containerView.frame.width * kEigth * 5, containerView.frame.height * kHalf)
		betMaxButton.addTarget(self, action: "betMaxButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)

		spinButton.setTitle("Spin", forState: UIControlState.Normal)
		spinButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
		spinButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 12)
		spinButton.backgroundColor = UIColor.greenColor()
		spinButton.sizeToFit()
		spinButton.center = CGPointMake(containerView.frame.width * kEigth * 7, containerView.frame.height * kHalf)
		spinButton.addTarget(self, action: "spinButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)

		containerView.addSubview(resetButton)
		containerView.addSubview(betOneButton)
		containerView.addSubview(betMaxButton)
		containerView.addSubview(spinButton)
	}
	
	func resetButtonPressed(button: UIButton) {
		hardReset()
	}
	
	func betOneButtonPressed(button: UIButton) {
		if credits < 1 {
			showAlertWithText(header: "No more credits", message: "Reset Game")
		} else {
			if currentBet < 5 {
				currentBet += 1
				credits -= 1
				updateMainView()
			} else {
				showAlertWithText(message: "You can only bet 5 credits at a time")
			}
		}
	}
	
	func betMaxButtonPressed(button: UIButton) {
		if credits < 1 {
			showAlertWithText(header: "No more credits", message: "Reset Game")
		} else {
			if currentBet < 5 {
				credits -= (5 - currentBet)
				currentBet = 5
				updateMainView()
			} else {
				showAlertWithText(message: "You can only bet 5 credits at a time")
			}
		}
	}
	
	func spinButtonPressed(button: UIButton) {
		slots = Factory.createSlots() //array of slot arrays
		setupSecondContainer(secondContainer)
		var winningMultiplier = SlotBrain.computeWinnings(slots)
		winnings = winningMultiplier * currentBet
		credits += winnings
		currentBet = 0
		updateMainView()
	}
	
	//Helpers
	func removeSlotImageViews(){
		if secondContainer != nil {
			let container:UIView? = secondContainer!
			let subViews:Array? = container!.subviews
			for view in subViews! {
				view.removeFromSuperview()
			}
		}
	}
	
	func hardReset() {
		removeSlotImageViews()
		slots.removeAll(keepCapacity: true)
		setupSecondContainer(secondContainer)
		credits = 50
		winnings = 0
		currentBet = 0
		updateMainView()
	}
	
	func updateMainView () {
		creditsLabel.text = "\(credits)"
		betLabel.text = "\(currentBet)"
		winnerPaidLabel.text = "\(winnings)"
	}
	
	func showAlertWithText (header: String = "Warning", message: String) {
		var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
		alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
		self.presentViewController(alert, animated: true, completion: nil)
	}
	
	
}