//
//  Balloon.swift
//  99 Red Balloons
//
//  Created by Stanley Chiang on 9/19/14.
//  Copyright (c) 2014 Stanley Chiang. All rights reserved.
//

import Foundation
import UIKit

struct Balloon{
	var image:UIImage
	
	init(image:UIImage){
		self.image = image
	}
}

func loadBalloons(max:Int) -> [Balloon]
{
	var newArray:[Balloon] = []
	for current in 0...max-1{
		newArray.append(Balloon(image: UIImage(named: "RedBalloon\(Int(arc4random_uniform(4))+1).jpg")))
	}
	return newArray
}

//for current in 0...max{
//	rando = Int(arc4random_uniform(4))
//	
//	switch rando {
//	case 0:
//		img = 1
//	case 1:
//		img = 2
//	case 2:
//		img = 3
//	case 3:
//		img = 4
//	default:
//		println("What happened here? :/")
//	}
//	
//	list.append(Balloon(image: UIImage(named: "RedBalloon\(img).jpg")))
//}
//
//}
