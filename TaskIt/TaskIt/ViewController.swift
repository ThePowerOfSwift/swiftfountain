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
		let date1 = Date.from(year: 2014, month: 5, day: 20)
		let date2 = Date.from(year: 2014, month: 3, day: 10)
		let date3 = Date.from(year: 2014, month: 1, day: 1)
		
		let task1 = TaskModel(task: "Study French", subtask: "homework", date: date1)
		let task2 = TaskModel(task: "Wash the dishes", subtask: "they're getting dirty", date: date2)
		let task3 = TaskModel(task: "Play golf", subtask: "for fun", date: date3)

		taskArray = [task1, task2, task3]
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if segue.identifier == "showTaskDetail" {
			let detailVC: TaskDetailViewController = segue.destinationViewController as TaskDetailViewController
//			let indexPath = sender?.indexPath as NSIndexPath
//			let theTask = taskArray[indexPath.row]
			let indexPath = tableView.indexPathForSelectedRow()
			let theTask = taskArray[indexPath!.row]
			detailVC.detailTaskModel = theTask
			
		}
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
		cell.dateLabel.text = Date.toString(date: theTask.date)
		
		return cell
	}
	
	//UITableViewDelegate
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		performSegueWithIdentifier("showTaskDetail", sender: self)
	}
}