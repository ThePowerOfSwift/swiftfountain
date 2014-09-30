//
//  TaskDetailViewController.swift
//  TaskIt
//
//  Created by Stanley Chiang on 9/29/14.
//  Copyright (c) 2014 Stanley Chiang. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {

	var mainVC: ViewController!
	var detailTaskModel: TaskModel!
	@IBOutlet weak var taskTextField: UITextField!
	@IBOutlet weak var subtaskTextField: UITextField!
	@IBOutlet weak var dueDatePicker: UIDatePicker!
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
		taskTextField.text = detailTaskModel.task
		subtaskTextField.text = detailTaskModel.subtask
		dueDatePicker.date = detailTaskModel.date
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	@IBAction func doneButtonPressed(sender: UIBarButtonItem) {
		var task = TaskModel(task: taskTextField.text, subtask: subtaskTextField.text, date: dueDatePicker.date, completed: false)
		mainVC.baseArray[0][mainVC.tableView.indexPathForSelectedRow()!.row] = task
		self.navigationController?.popViewControllerAnimated(true)
	}

	@IBAction func cancelButtonPressed(sender: UIBarButtonItem) {
		self.navigationController?.popViewControllerAnimated(true)
	}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
