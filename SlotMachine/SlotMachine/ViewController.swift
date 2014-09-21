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
	
	//constants
	let kMarginForView:CGFloat = 10.0
	let kSixth:CGFloat = 1/6
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		setupContainerViews()
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

}

