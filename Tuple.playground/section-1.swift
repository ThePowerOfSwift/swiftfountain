// Playground - noun: a place where people can play

import UIKit

var thisTuple = ([3])
println(thisTuple.0[0])

switch thisTuple {
case(NSArray(array: [3])):
	println("hey, there")
default:
	println("default")
}


//simple tuple
var tuple = (0, "thing1", 2.0, [3])
println("\(tuple.1)")

//named/aliased tuple
var namedTuple = (anInt:0, aString:"thing1", aDouble:2.0, anArray:[3])
println("\(namedTuple.aString)")

//switch cased tuple
switch namedTuple {
//case (_,_,_,[3]):
//	println("no intervalType errors anymore, yay!")
case (0, "thing1", 2.0, _):
	println("first case")
case (_,_,2.0,_):
	println("second case")
default:
	println("default")
}

