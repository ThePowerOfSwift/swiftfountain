//
//  Factory.swift
//  SlotMachine
//
//  Created by Stanley Chiang on 9/21/14.
//  Copyright (c) 2014 Stanley Chiang. All rights reserved.
//

import Foundation
import UIKit

class Factory {
	class func createSlots () -> [[Slot]] {
		let kNumRows = 3
		let kNumCols = 3
		var arrayOfSlotArrays: [[Slot]] = []
		for var colNum = 0; colNum < kNumCols; colNum++ {
			var slotArray:[Slot] = []
			for var rowNum = 0; rowNum < kNumRows; rowNum++ {
				var slot = Factory.createSlot(slotArray)
				slotArray.append(slot)
			}
			arrayOfSlotArrays.append(slotArray)
		}
		return arrayOfSlotArrays
	}
	
	class func createSlot (currentCards: [Slot]) -> Slot {
		var currentCardValues:[Int] = []
		var rando:Int
		
		for slot in currentCards {
			currentCardValues.append(slot.value)
		}
		do {rando = Int(arc4random_uniform(UInt32(13)))}
		while contains(currentCardValues, rando + 1 )
		
		var slot:Slot
		switch rando {
			case 0:
				slot = Slot(value: 1, image: UIImage(named: "Ace"), isRed: true)
			case 1:
				slot = Slot(value: 2, image: UIImage(named: "Two"), isRed: true)
			case 2:
				slot = Slot(value: 3, image: UIImage(named: "Three"), isRed: true)
			case 3:
				slot = Slot(value: 4, image: UIImage(named: "Four"), isRed: true)
			case 4:
				slot = Slot(value: 5, image: UIImage(named: "Five"), isRed: false)
			case 5:
				slot = Slot(value: 6, image: UIImage(named: "Six"), isRed: false)
			case 6:
				slot = Slot(value: 7, image: UIImage(named: "Seven"), isRed: true)
			case 7:
				slot = Slot(value: 8, image: UIImage(named: "Eight"), isRed: false)
			case 8:
				slot = Slot(value: 9, image: UIImage(named: "Nine"), isRed: false)
			case 9:
				slot = Slot(value: 10, image: UIImage(named: "Ten"), isRed: true)
			case 10:
				slot = Slot(value: 11, image: UIImage(named: "Jack"), isRed: false)
			case 11:
				slot = Slot(value: 12, image: UIImage(named: "Queen"), isRed: false)
			default:
				slot = Slot(value: 13, image: UIImage(named: "King"), isRed: true)
		}
		return slot
	}
}