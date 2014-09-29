//
//  ViewController.swift
//  TaskIt
//
//  Created by Stanley Chiang on 9/26/14.
//  Copyright (c) 2014 Stanley Chiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

	@IBOutlet weak var tableView: UITableView!
	var taskArray:[TaskModel] = []
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		let task1 = TaskModel(task: "Study French", subtask: "homework", date: "01/14/14")
		let task2 = TaskModel(task: "Wash the dishes", subtask: "they're getting dirty", date: "11/14/14")
		let task3 = TaskModel(task: "Play golf", subtask: "for fun", date: "11/11/14")
		
//		let task1:Dictionary<String,String> = ["task":"study classes", "subtask":"homework", "date":"01/14/14"]
//		let task2:Dictionary<String,String> = ["task":"do the dishes", "subtask":"lots o' dishes", "date":"05/14/14"]
//		let task3:Dictionary<String,String> = ["task":"wash car", "subtask":"dirty dirty", "date":"11/13/14"]
		taskArray = [task1, task2, task3]
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	//UITableViewDataSource
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return taskArray.count
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		
		let theTask = taskArray[indexPath.row]
		
		var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell
		
		cell.taskLabel.text = theTask.task
		cell.descriptionLabel.text = theTask.subtask
		cell.dateLabel.text = theTask.date
		
		return cell
	}
	
	//UITableViewDelegate
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		
	}
}