//
//  ViewController.swift
//  TaskIt
//
//  Created by Stanley Chiang on 9/26/14.
//  Copyright (c) 2014 Stanley Chiang. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {

	@IBOutlet weak var tableView: UITableView!
	var baseArray:[[TaskModel]] = [[]]
	
	let managedObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext!
	var fetchedResultsController:NSFetchedResultsController = NSFetchedResultsController()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		fetchedResultsController = getFetchResultsController()
		fetchedResultsController.delegate = self
		fetchedResultsController.performFetch(nil)
	}
	
	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
//instead of having to write a function and then pass that function in as a parameter we can write the necessary code inside of the parameter
//			func sortByDate (taskOne: TaskModel, taskTwo: TaskModel) -> Bool {
//				return taskOne.date.timeIntervalSince1970 < taskTwo.date.timeIntervalSince1970
//			}
//			taskArray = taskArray.sorted(sortByDate)
//			baseArray[0] = baseArray[0].sorted{
//				(taskOne: TaskModel, taskTwo: TaskModel) -> Bool in
//				//comparison logic here
//				return taskOne.date.timeIntervalSince1970 < taskTwo.date.timeIntervalSince1970
//			}
		
		
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
			let theTask = fetchedResultsController.objectAtIndexPath(indexPath!) as TaskModel
			detailVC.detailTaskModel = theTask
		} else if segue.identifier == "showTaskAdd" {
			let addTaskVC:AddTaskViewController = segue.destinationViewController as AddTaskViewController
		}
	}
	
	@IBAction func addButtonTapped(sender: UIBarButtonItem) {
		self.performSegueWithIdentifier("showTaskAdd", sender: self)
	}
	//UITableViewDataSource
	
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return fetchedResultsController.sections!.count
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return fetchedResultsController.sections![section].numberOfObjects
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		
		let theTask = fetchedResultsController.objectAtIndexPath(indexPath) as TaskModel
		
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
		let theTask = fetchedResultsController.objectAtIndexPath(indexPath) as TaskModel
		
		if indexPath.section == 0 {
			theTask.completed = true
		} else {
			theTask.completed = false
		}
		(UIApplication.sharedApplication().delegate as AppDelegate).saveContext()
		
	}
	
	func controllerDidChangeContent(controller: NSFetchedResultsController) {
		tableView.reloadData()
	}
	
	//helper
	func taskFetchRequest() -> NSFetchRequest {
		let fetchRequest = NSFetchRequest(entityName: "TaskModel")
		let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
		let completedDescriptor = NSSortDescriptor(key: "completed", ascending: true)
		fetchedResultsController = NSFetchedResultsController(fetchRequest: taskFetchRequest(), managedObjectContext: managedObjectContext, sectionNameKeyPath: "completed", cacheName: nil)
		
		fetchRequest.sortDescriptors = [completedDescriptor, sortDescriptor]
		
		return fetchRequest
	}
	
	func getFetchResultsController() -> NSFetchedResultsController {
		fetchedResultsController = NSFetchedResultsController(fetchRequest: taskFetchRequest(), managedObjectContext: managedObjectContext, sectionNameKeyPath: "completed", cacheName: nil)
		return fetchedResultsController
	}
}






