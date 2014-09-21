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
	let kSixth:CGFloat = 1/6
	let kNumberOfRows = 3
	let kNumberOfCols = 3
	let kThird:CGFloat = 1/3
	let kMarginForSlot:CGFloat = 2.0
	
	//third container: information labels
	var creditsLabel: UILabel!
	var betLabel: UILabel!
	var winnerPaidLabel: UILabel!
	var creditsTitleLabel: UILabel!
	var betTitleLabel: UILabel!
	var winnerPaidTitleLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		setupContainerViews()
		setupFirstContainer(firstContainer)
		setupSecondContainer(secondContainer)
		setupThirdContainer(thirdContainer)
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
		for var rowNumber = 0; rowNumber < kNumberOfRows; ++rowNumber {
			for var colNumber = 0; colNumber < kNumberOfCols; ++colNumber {
				var slotImageView = UIImageView()
				slotImageView.backgroundColor = UIColor.yellowColor()
				slotImageView.frame = CGRectMake(containerView.bounds.origin.x + (containerView.bounds.width * kThird * CGFloat(rowNumber)),
												 containerView.bounds.origin.y + (containerView.bounds.height * kThird * CGFloat(colNumber)),
												 containerView.bounds.width * kThird - kMarginForSlot,
												 containerView.bounds.height * kThird - kMarginForSlot)
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
}