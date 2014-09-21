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
	var lions:[Lion] = []
    var rando:Int = 0
	var currentAnimal = (species: "Tiger", index: 0)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.ds
		
		//Tigers
        var tiger2 = Tiger(age: 2, name: "sibal", breed: "siberian", image: UIImage(named: "SiberianTiger.jpg"))
        var tiger3 = Tiger(age: 3, name: "mani", breed: "malyan", image: UIImage(named: "MalayanTiger.jpg"))
        
        tigers.append(Tiger(age: 1, name:"ben", breed: "bengal", image: UIImage(named: "BengalTiger.jpg")))
        tigers += [tiger2, tiger3]
		
		//Lions
        lions += [
			Lion(age: 1, name: "Mufasa", subspecies: "West African", isAlphaMale: false, image: UIImage(named: "Bo.jpg")),
			Lion(age: 2, name: "Sarabi", subspecies: "Barbary", isAlphaMale: false, image: UIImage(named: "JRT.jpg"))
		]
    }
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	func updateAnimal(){
		switch currentAnimal{
		case ("Tiger",_):
			do {rando = Int(arc4random_uniform(UInt32(lions.count)))}
				while nameLabel.text == lions[rando].name
			currentAnimal = ("Lion", rando)
		default:
			do {rando = Int(arc4random_uniform(UInt32(tigers.count)))}
				while nameLabel.text == tigers[rando].name
			currentAnimal = ("Tiger", rando)
		}
	}
	
	func updateView(){
		UIView.transitionWithView(
			self.view,
			duration: 0.2,
			options: UIViewAnimationOptions.TransitionCrossDissolve,
			animations: {
				if self.currentAnimal.species == "Tiger" {
					self.myimageView.image = self.tigers[self.rando].image
					self.nameLabel.text = self.tigers[self.rando].name
					self.breedLabel.text = self.tigers[self.rando].breed
					self.ageLabel.text = "\(self.tigers[self.rando].age)"
				} else {
					self.myimageView.image = self.lions[self.rando].image
					self.nameLabel.text = self.lions[self.rando].name
					self.breedLabel.text = self.lions[self.rando].subspecies
					self.ageLabel.text = "\(self.lions[self.rando].age)"
				}
			},
			completion: {
				(finished: Bool) -> () in
			}
		)
	}
	
    @IBAction func nextPressed(sender: UIBarButtonItem) {
		updateAnimal()
		updateView()
		//tigers[rando].chuff()
    }
}
