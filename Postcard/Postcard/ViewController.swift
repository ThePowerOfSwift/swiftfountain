//
//  ViewController.swift
//  Postcard
//
//  Created by Stanley Chiang on 9/12/14.
//  Copyright (c) 2014 Stanley Chiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var recipientField: UITextField!
    @IBOutlet weak var messageField: UITextField!
    @IBOutlet weak var mailButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    @IBAction func sendPressed(sender: UIButton) {
        messageLabel.hidden = false
        messageLabel.text = messageField.text
        messageField.text = ""
        messageField.resignFirstResponder()
        messageLabel.textColor = UIColor.redColor()
        mailButton.setTitle("Sent", forState: UIControlState.Normal)
    }

}