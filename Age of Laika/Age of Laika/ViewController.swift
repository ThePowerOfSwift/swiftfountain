//
//  ViewController.swift
//  Age of Laika
//
//  Created by Stanley Chiang on 9/13/14.
//  Copyright (c) 2014 Stanley Chiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var humanAgeField: UITextField!
    @IBOutlet weak var newAgeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func convertPressed(sender: UIButton) {
        let conversion = 7.2
        var dog = Double((humanAgeField.text as NSString).doubleValue) * Double(conversion)
        newAgeLabel.text = "\(dog)"
        newAgeLabel.hidden = false
        humanAgeField.resignFirstResponder()
    }

}

