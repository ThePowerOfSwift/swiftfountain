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
	var baseArray:[[TaskModel]] = [[]]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		let date1 = Date.from(year: 2014, month: 5, day: 20)
		let date2 = Date.from(year: 2014, month: 3, day: 10)
		let date3 = Date.from(year: 2014, month: 1, day: 1)
		
		let task1 = TaskModel(task: "Study French", subtask: "homework", date: date1, completed: false)
		let task2 = TaskModel(task: "Wash the dishes", subtask: "they're getting dirty", date: date2, completed: false)
		let task3 = TaskModel(task: "Play golf", subtask: "for fun", date: date3, completed: false)

		let taskArray = [task1, task2, task3]
		
		var completedArray = [TaskModel(task: "Code", subtask: "Task Project", date: date2, completed: true)]
		
		baseArray = [taskArray, completedArray]
	}
	
	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
//instead of having to write a function and then pass that function in as a parameter we can write the necessary code inside of the parameter
//			func sortByDate (taskOne: TaskModel, taskTwo: TaskModel) -> Bool {
//				return taskOne.date.timeIntervalSince1970 < taskTwo.date.timeIntervalSince1970
//			}
//			taskArray = taskArray.sorted(sortByDate)
		
			baseArray[0] = baseArray[0].sorted{
				(taskOne: TaskModel, taskTwo: TaskModel) -> Bool in
				//comparison logic here
				return taskOne.date.timeIntervalSince1970 < taskTwo.date.timeIntervalSince1970
			}
			
			tableView.reloadData()
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
			let theTask = baseArray[indexPath!.section][indexPath!.row]
			detailVC.detailTaskModel = theTask
			detailVC.mainVC = self
		} else if segue.identifier == "showTaskAdd" {
			let addTaskVC:AddTaskViewController = segue.destinationViewController as AddTaskViewController
			addTaskVC.mainVC = self
		}
	}
	
	@IBAction func addButtonTapped(sender: UIBarButtonItem) {
		self.performSegueWithIdentifier("showTaskAdd", sender: self)
	}
	//UITableViewDataSource
	
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return baseArray.count
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return baseArray[section].count
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		
		let theTask = baseArray[indexPath.section][indexPath.row]
		
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
	
	func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 25
	}
	
	func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		if section == 0 {
			return "To do"
		} else {
			return "Completed"
		}
	}
	
	func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
		let theTask = baseArray[indexPath.section][indexPath.row]
		
		if indexPath.section == 0 {
			var newTask = TaskModel(task: theTask.task, subtask: theTask.subtask, date: theTask.date, completed: true)
			baseArray[1].append(newTask)
		} else {
			var newTask = TaskModel(task: theTask.task, subtask: theTask.subtask, date: theTask.date, completed: false)
			baseArray[0].append(newTask)
		}
		
		baseArray[indexPath.section].removeAtIndex(indexPath.row)
		tableView.reloadData()
	}
}






