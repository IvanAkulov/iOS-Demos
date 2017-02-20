//: Playground - noun: a place where people can play

import UIKit

let string = "My name is Slim Shady"

//string.characters[5]
let startIndex = string.startIndex
let endIndex = string.endIndex

string.characters[startIndex]
string[string.startIndex]

let indexOfTwo = string.index(after: startIndex)
string.characters[indexOfTwo]

let indexOfTwenty = string.index(before: endIndex)
string.characters[indexOfTwenty]

let index_ = string.index(startIndex, offsetBy: 11)
string.characters[index_]

let index = string.index(startIndex, offsetBy: 11, limitedBy: endIndex)

if let negativeIndex = string.index(endIndex, offsetBy: -10, limitedBy: startIndex) {
    string.characters[negativeIndex]
}

let range = index_ ..< endIndex
string[range]



extension String {

    subscript (i: Int) -> String? {
        if characters.count > i && i >= 0 {
            return String(Array(self.characters)[i])
        }
        return nil
    }

    subscript (r: Range<Int>) -> String? {
        guard r.lowerBound >= 0 && r.upperBound <= self.characters.count && r.upperBound >= r.lowerBound else { return nil }
        let start = self.index(startIndex, offsetBy: r.lowerBound)
        let end = self.index(startIndex, offsetBy: r.upperBound)
        return self[Range(start ..< end)]
    }
    
    func indexAt(int: Int) -> String.Index? {
        if characters.count > int {
            return index(self.startIndex, offsetBy: int)
        }
        return nil
    }
}

string[4]
string[3..<21]
string.indexAt(int: 10)















