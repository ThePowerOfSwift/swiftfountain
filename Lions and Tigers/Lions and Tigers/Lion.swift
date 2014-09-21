//
//  Lion.swift
//  Lions and Tigers
//
//  Created by Stanley Chiang on 9/20/14.
//  Copyright (c) 2014 Stanley Chiang. All rights reserved.
//

import Foundation
import UIKit

class Lion {
	var age:Int, name:String, subspecies:String, isAlphaMale:Bool, image:UIImage
	init(){
		self.age = 0
		self.name = ""
		self.subspecies = ""
		self.isAlphaMale = false
		self.image = UIImage(named: "")
	}
	init(age:Int, name:String, subspecies:String, isAlphaMale:Bool, image:UIImage){
		self.age = age
		self.name = name
		self.subspecies = subspecies
		self.isAlphaMale = isAlphaMale
		self.image = image
	}
	func becomeAlphaMale(){
		//unlike a struct, the class can access itself
		self.isAlphaMale = true
	}
}