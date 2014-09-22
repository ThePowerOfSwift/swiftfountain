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
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		invCont(inventory)
		supCont(supplies)
		mixCont(mix)
		startCont(startSelling)
	
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	func invCont(cont: UIView) {
		
	}
	
	func supCont(cont: UIView) {
		
	}
	
	func mixCont(cont: UIView) {
		
	}
	
	func startCont(cont: UIView) {
		
	}
}

