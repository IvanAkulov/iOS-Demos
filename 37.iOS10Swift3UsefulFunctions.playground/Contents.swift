//: Playground - noun: a place where people can play

import UIKit

let mates = ["Alex", "Max", "Vika", "Rustem", "Olga"]
let points = [100, 90, 60, 88, 76]

var totalScore = [(String, Int)]()

for i in 0..<mates.count {
    totalScore.append((mates[i], points[i]))
}

totalScore

let totalScore_zip = Array(zip(mates, points))

let array2D = [[1, 2], [3, 4], [5, 6], [7, 8]]
let array1D = array2D.flatMap{$0}
print(array1D)

let array1D_joined = Array(array2D.joined(separator: [10]))
let array1D_joined_1 = array2D.joined().map{$0}
