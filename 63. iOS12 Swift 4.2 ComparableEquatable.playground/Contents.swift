import UIKit

// Equatable, Comparable

struct User {
    var login: String
    var email: String
    var age: Int
}

extension User: Equatable {
    static func == (lhs: User, rhs: User) -> Bool {
        return  lhs.login == rhs.login &&
                lhs.email == rhs.email &&
                lhs.age == rhs.age
    }
}

extension User: Comparable {
    static func < (lhs: User, rhs: User) -> Bool {
        return lhs.age < rhs.age
    }
    
    static func <= (lhs: User, rhs: User) -> Bool {
        return lhs.age <= rhs.age
    }
    
    static func >= (lhs: User, rhs: User) -> Bool {
        return lhs.age >= rhs.age
    }
    
    static func > (lhs: User, rhs: User) -> Bool {
        return lhs.age > rhs.age
    }
}

let sheldon = User(login: "Sheldon", email: "shelly@swiftbook.ru", age: 43)
let leonard = User(login: "Leonard", email: "leo@swiftbook.ru", age: 42)

if sheldon == leonard {
    print("users should differ")
} else {
    print("this users truly differ")
}

if sheldon > leonard {
    print("Sheldon is \(sheldon.age - leonard.age) year(s) older than Leonard.")
}
