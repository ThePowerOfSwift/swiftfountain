//
//  AddTaskViewController.swift
//  TaskIt
//
//  Created by Stanley Chiang on 9/29/14.
//  Copyright (c) 2014 Stanley Chiang. All rights reserved.
//

import UIKit

class AddTaskViewController: ViewController {

	var mainVC: ViewController!
	@IBOutlet weak var taskTextField: UITextField!
	@IBOutlet weak var subtaskTextField: UITextField!
	@IBOutlet weak var duedatePicker: UIDatePicker!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	@IBAction func cancelButtonTapped(sender: UIButton) {
		self.dismissViewControllerAnimated(true, completion: nil)
	}

	@IBAction func addTaskButtonTapped(sender: UIButton) {
		var task = TaskModel(task: taskTextField.text, subtask: subtaskTextField.text, date: duedatePicker.date)
		mainVC.taskArray.append(task)
		self.dismissViewControllerAnimated(true, completion: nil)
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
