//
//  SlotBrain.swift
//  SlotMachine
//
//  Created by Stanley Chiang on 9/22/14.
//  Copyright (c) 2014 Stanley Chiang. All rights reserved.
//

import Foundation

class SlotBrain{
	class func unpackSlots (slots: [[Slot]]) -> [[Slot]] {
		var row1:[Slot] = []
		var row2:[Slot] = []
		var row3:[Slot] = []
		
			for var index = 0; index < slots.count; index++ {
				row1.append(slots[index][0])
				row2.append(slots[index][1])
				row3.append(slots[index][2])
			}

		var transposed: [[Slot]] = [row1, row2, row3]
		return transposed
	}
	
	class func computeWinnings (slots: [[Slot]]) -> Int {
		var winnings = 0
		for row in unpackSlots(slots) {
			if checkFlush(row) {
				winnings += 1
			}
			if checkTrips(row) {
				winnings += 1
			}
			if checkStraights(row) {
				winnings += 1
			}
		}
		return winnings
	}
	
	class func checkFlush(rows: [Slot]) -> Bool {
		if rows[0].isRed && rows[1].isRed && rows[2].isRed || rows[0].isRed == false && rows[1].isRed == false && rows[2].isRed == false {
			return true
		}
		return false
	}
	class func checkTrips(rows: [Slot]) -> Bool {
		if rows[0].value == rows[1].value && rows[1].value == rows[2].value {
			return true
		}
		return false
	}
	class func checkStraights(rows: [Slot]) -> Bool {
		if rows[0].value + 1 == rows[1].value && rows[0].value + 2 == rows[2].value {
			return true
		}
		return false
	}
}