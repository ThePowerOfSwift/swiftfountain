// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let firstInt = 0
var x=0, y=1, z=2

var number:float_t = 5.0

var bigNumber = 1_000_000_000
var uglyNumber = 1000000000

//number to string
var num = 5
var aString = "the string is: " + "\(num)"

//string to number
var one = "1"
var stringToOptional = one.toInt()
var optionalToInt = stringToOptional!

var doubleString = "3.14"
var doubleValue = Double((doubleString as NSString).doubleValue)