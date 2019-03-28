import UIKit

let rain = #"The "rain" in "Spain" falls mainly on the Spaniards."#

let keypaths = #"Swift keypaths such as \Person.name hold uninvoked references to properties."#

let answer = 42
let dontpanic = #"The answer to life, the universe, and everything is \#(answer)."#

let str = ##"My dog said "woof"#gooddog"##

let multiline = #"""
The answer to life,
the universe,
and everything is \#(answer).
"""#

let regex1 = "\\\\[A-Z]+[A-Za-z]+\\.[a-z]+"

let regex2 = #"\\[A-Z]+[A-Za-z]+\.[a-z]+"#


enum PasswordError: Error {
    case short
    case obvious
    case simple
    case old
}

func showOld(error: PasswordError) {
    switch error {
    case .short:
        print("Your password was too short.")
    case .obvious:
        print("Your password was to obvious")
     @unknown default:
        print("Your password was too simple")
    }
}


let times = [
    "Alexey": "28",
    "Ivan": "33",
    "Mila": "15",
    "Bob": "DNF"
]

let finishers1 = times.compactMapValues { Int($0) }
print(finishers1)

let finishers2 = times.compactMapValues(Int.init)
print(finishers2)

let people = [
    "Alexey": 28,
    "Ivan": 33,
    "Mila": 15,
    "Bob": nil
]

let knownAges = people.compactMapValues { $0 }
print(knownAges)


let rowNumber = 4

if rowNumber.isMultiple(of: 2) {
    print("Even")
} else {
    print("Odd")
}

if rowNumber % 2 == 0 {
    
}

