//
//  ViewController.swift
//  Lions and Tigers
//
//  Created by Stanley Chiang on 9/16/14.
//  Copyright (c) 2014 Stanley Chiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myimageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        var tigers:[Tiger] = []
        
        var myTiger = Tiger(age: 1, name:"ben", breed: "bengal", image: UIImage(named: "BengalTiger.jpg"))
        
        var tiger2 = Tiger(age: 2, name:"sibal", breed: "siberian", image: UIImage(named: "SiberianTiger.jpg"))
        
        var tiger3 = Tiger(age: 3, name:"mani", breed: "malyan", image: UIImage(named: "MalayanTiger.jpg"))
        
        tigers.append(myTiger)
        tigers += [tiger2, tiger3]
//        tigers.append(tiger2)
//        tigers.append(tiger3)
        
//        for tiger in tigers{
//            println(tiger.breed)
//        }
        var rando:Int;
        rando = Int(arc4random_uniform(UInt32(tigers.count)))
        
        myimageView.image = tigers[rando].image
        nameLabel.text = tigers[rando].name
        breedLabel.text = tigers[rando].breed
        ageLabel.text = "\(tigers[rando].age)"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextPressed(sender: UIBarButtonItem) {

    }

}
