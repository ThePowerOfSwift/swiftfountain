//
//  ViewController.swift
//  ShoeConverter
//
//  Created by Stanley Chiang on 9/13/14.
//  Copyright (c) 2014 Stanley Chiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func convertPressed(sender: UIButton) {
        let multiplier = 2.4
        var converted = Double(inputField.text.toInt()!) * multiplier
        resultLabel.hidden = false
        resultLabel.text = "\(converted)"
        inputField.resignFirstResponder()
    }

}

