//
//  ViewController.swift
//  TaskIt
//
//  Created by Stanley Chiang on 9/26/14.
//  Copyright (c) 2014 Stanley Chiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.

	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	//UITableViewDataSource
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 5
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		
		var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell
		
		return cell
	}
	
	//UITableViewDelegate
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		
	}
}