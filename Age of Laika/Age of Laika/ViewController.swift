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
//each human year equals 10.5 dog years for the first two years, then 4 dog years for each human year thereafter
    @IBAction func convertPressed(sender: UIButton) {
        var human = Double((humanAgeField.text as NSString).doubleValue)
        var dog:Double
        if human < 2 {
            dog = human * 10.5
        } else{
            dog = 21 + 4 * (human - 2)
        }
            
        newAgeLabel.text = "\(dog)"
        newAgeLabel.hidden = false
        humanAgeField.resignFirstResponder()
    }

}

