//
//  Tiger.swift
//  Lions and Tigers
//
//  Created by Stanley Chiang on 9/16/14.
//  Copyright (c) 2014 Stanley Chiang. All rights reserved.
//

import Foundation
import UIKit

struct Tiger{
    var age:Int, name:String, breed:String, image:UIImage
	init(){
		self.age = 0
		self.name = ""
		self.breed = ""
		self.image = UIImage(named: "")
	}
    init(age: Int, name: String, breed: String, image: UIImage){
        self.age = age
        self.name = name
        self.breed = breed
        self.image = image
    }
    
    func chuff(){
        println("Tiger: Chuff Chuff")
    }
}