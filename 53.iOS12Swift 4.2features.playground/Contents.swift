import UIKit

// Производные коллекции перечислений

enum PlanetsOfSolarSystem: Int, CaseIterable {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

for planet in PlanetsOfSolarSystem.allCases {
    print("\(planet) is the \(planet.rawValue) planet from the sun")
}

// Добавление свойства allCases в перечисление со связанными значениями

enum Car: CaseIterable {
    static var allCases: [Car] {
        return [.ford, .toyota, .jaguar, .bmw, .porsche(convertible: false), .porsche(convertible: true)]
    }
    
    case ford, toyota, jaguar, bmw
    case porsche(convertible: Bool)
}

// Использование allCases с unavailable

enum Direction: CaseIterable {
    static var allCases: [Direction] {
        return [.north, .south, .east, .west]
    }
    
    case north, south, east, west
    
    @available(*, unavailable)
    case all
}

// Динамический поиск элемента

@dynamicMemberLookup
struct Person {
    subscript(dynamicMember member: String) -> String {
        let properties = ["name": "Taylor Swift", "city": "Nashville"]
        return properties[member, default: ""]
    }
}

let person = Person()
print(person.name)
print(person.city)
print(person.favoriteIceCream)


// Испльзование различных типов данных

@dynamicMemberLookup
struct Employee {
    subscript(dynamicMember member: String) -> String {
        let properties = ["name": "Taylor Swift", "city": "Nashville"]
        return properties[member, default: ""]
    }
    
    subscript(dynamicMember member: String) -> Int {
        let properties = ["age": 26, "height": 178]
        return properties[member, default: 0]
    }
}

let employee = Employee()
let age: Int = employee.age

// Использование замыканий

@dynamicMemberLookup
struct User {
    subscript(dynamicMember member: String) -> (_ input: String) -> Void {
        return {
            print("Hello! I live at the address \($0).")
        }
    }
}

let user = User()
user.printAddress("555 Taylor Swift Avenue")

@dynamicMemberLookup
struct Singer {
    public var name = "Justin Bieber"
    
    subscript(dynamicMember member: String) -> String {
        return "Taylor Swift"
    }
}

let singer = Singer()
print(singer.name)
print(singer.anotherSinger)

@dynamicMemberLookup
class Sandwich {
    subscript(dynamicMember member: String) -> String {
        return "I'm a sandwich!"
    }
}

class HotDog: Sandwich { }

let chiliDog = HotDog()
print(chiliDog.description)

@dynamicMemberLookup
protocol Subscripting { }

extension Subscripting {
    subscript(dynamicMember member: String) -> String {
        return "This is coming from the subscript"
    }
}

extension String: Subscripting { }
let str = "Hello, Swift"
print(str.example)

@dynamicMemberLookup
enum JSON {
    case intValue(Int)
    case stringValue(String)
    case arrayValue(Array<JSON>)
    case dictionaryValue(Dictionary<String, JSON>)
    
    var stringValue: String? {
        if case .stringValue(let str) = self {
            return str
        }
        return nil
    }
    
    subscript(index: Int) -> JSON? {
        if case .arrayValue(let arr) = self {
            return index < arr.count ? arr[index] : nil
        }
        return nil
    }
    
    subscript(key: String) -> JSON? {
        if case .dictionaryValue(let dict) = self {
            return dict[key]
        }
        return nil
    }
    
    subscript(dynamicMember member: String) -> JSON? {
        if case .dictionaryValue(let dict) = self {
            return dict[member]
        }
        return nil
    }
}

// Без использования dynamic member:

let json = JSON.stringValue("Example")
json[0]?["name"]?["first"]?.stringValue

// Используя dynamic member:

json[0]?.name?.first?.stringValue

// Random

let randomInt = Int.random(in: 1..<5)
let randomFloat = Float.random(in: 1..<10)
let randomDouble = Double.random(in: 1...100)
let randomCGFloat = CGFloat.random(in: 1...1000)

var albums = ["Red", "1989", "Reputation"]

// Перетасовка элементов массива
albums.shuffle()

// Создание нового массива с перетасованными элементами
let shuffled = albums.shuffled()

if let random = albums.randomElement() {
    print("The random album is \(random).")
}

// Hashing

struct iPad: Hashable {
    var serialNumber: String
    var capacity: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(serialNumber)
    }
}

let first = iPad(serialNumber: "12345", capacity: 256)
let second = iPad(serialNumber: "54321", capacity: 512)

var hasher = Hasher()
hasher.combine(first)
hasher.combine(second)
let hash = hasher.finalize()

// Проверка на соответствие условию

let scores = [85, 88, 95, 92]

let passed = scores.allSatisfy { $0 >= 85 }

if passed {
    print("Congratulations on the successful completion of the course")
}

// Удаление элементов коллекций

var names = ["John", "Michael", "Graham", "Terry", "Eric", "Terry"]
names.removeAll { $0.hasPrefix("Terry") }
print(names)

// Смена значения логического типа

extension Bool {
    mutating func toggle() {
        self = !self
    }
}

var loggedIn = false
loggedIn.toggle()
