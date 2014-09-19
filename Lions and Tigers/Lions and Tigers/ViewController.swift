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

    var tigers:[Tiger] = []
    var rando:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.ds
        
//        var myTiger = Tiger(age: 1, name:"ben", breed: "bengal", image: UIImage(named: "BengalTiger.jpg"))
        
        var tiger2 = Tiger(age: 2, name:"sibal", breed: "siberian", image: UIImage(named: "SiberianTiger.jpg"))
        var tiger3 = Tiger(age: 3, name:"mani", breed: "malyan", image: UIImage(named: "MalayanTiger.jpg"))
        
        tigers.append(Tiger(age: 1, name:"ben", breed: "bengal", image: UIImage(named: "BengalTiger.jpg")))
        tigers += [tiger2, tiger3]

//        for tiger in tigers{
//            println(tiger.breed)
//        }
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
        
        do {rando = Int(arc4random_uniform(UInt32(tigers.count)))}
        while nameLabel.text == tigers[rando].name
        //println(rando)
        UIView.transitionWithView(self.view, duration: 0.2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            self.myimageView.image = self.tigers[self.rando].image
            self.nameLabel.text = self.tigers[self.rando].name
            self.breedLabel.text = self.tigers[self.rando].breed
            self.ageLabel.text = "\(self.tigers[self.rando].age)"
            }, completion: { (finished: Bool) -> () in
        })
    }
}
