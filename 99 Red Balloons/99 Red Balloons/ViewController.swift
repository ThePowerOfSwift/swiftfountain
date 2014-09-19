//
//  ViewController.swift
//  99 Red Balloons
//
//  Created by Stanley Chiang on 9/19/14.
//  Copyright (c) 2014 Stanley Chiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var balloonLabel: UILabel!
	@IBOutlet weak var myImage: UIImageView!

	var list:[Balloon] = []
	var count:Int = 0
	var max = 9
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		list = loadBalloons(max)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func nextPressed(sender: UIBarButtonItem) {
		if count < max{
			balloonLabel.text = "balloon #\(count+1)"
			myImage.image = list[count].image
		} else {
			balloonLabel.text = "that's all folks!"
		}
		count++
	}

}