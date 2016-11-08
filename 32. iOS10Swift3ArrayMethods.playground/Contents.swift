//: Playground - noun: a place where people can play

import UIKit

let array = [1, 2, 3, 4, 5, 6]

//var array1: [Int] = []
//
//for i in array {
//  array1.append(i * i)
//}
//array1

let array1 = array.map{ i in i * i }
let array2 = array.map{ $0 * $0 }
array1


//var array3: [Int] = []
//
//for i in array {
//  if i % 2 == 0 {
//    array3.append(i)
//  }
//}
//array3

let array3 = array.filter{ i in i % 2 == 0 }
let array4 = array.filter{ $0 % 2 == 0 }
array3
array4

let array5 = array.map{$0 * $0}.filter{ $0 % 2 == 0 }
array5


//var sum = 0
//for i in array {
//  sum += i
//}
//sum

let sum = array.reduce(0) { sum, i in sum + i }
let sum1 = array.reduce(0, +)
sum








