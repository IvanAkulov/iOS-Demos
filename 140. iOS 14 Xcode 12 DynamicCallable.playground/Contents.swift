import UIKit

// Swift 5 +

// func dynamicallyCall(withArguments args: [AnyObject]) -> AnyObject

// func dynamicallyCall(withKeywordArguments args: KeyValuePairs<String, AnyObject>) -> AnyObject

@dynamicCallable
class ListCaseChanger {
	enum Case: String, RawRepresentable {
		case uppercase = "uppercase"
		case lowercase = "lowercase"
	}
	
	func f() {
		
	}

	func dynamicallyCall(withArguments args: [String]) -> String? {
		guard let casing = args.first, let string = args.last else {
			return nil
		}
		
		let casingType = Case(rawValue: casing.lowercased()) ?? Case.lowercase
		return casingType == .uppercase ? string.uppercased() : string.lowercased()
	}
}

let listCaseChanger = ListCaseChanger()
let listChangedCase = listCaseChanger("uppercase", "Katarina Claes")
print(listChangedCase)

// KeyValuePairs
// Key не обязательно должен соответствовать Hashable.
// Key могут повторяться.
// Порядок, в котором добавляются элементы, сохраняется.
// Реализует Sequence протокол => for pairs in keyValuePairs
// Менее безопасный доступ: keyValuePairs[0].value keyValuePairs[0].key

@dynamicCallable
class PairsCaseChanger {
	enum SiteCategory: String, RawRepresentable {
		case science = "science"
		case art = "art"
	}
	
	func dynamicallyCall(withKeywordArguments args: KeyValuePairs<String, String>) -> String? {
		guard let categoryPair = args.first, let pathPair = args.last else {
			return nil
		}
		
		guard categoryPair.key == "category" && pathPair.key == "string" else {
			return nil
		}
		
		let category = SiteCategory(rawValue: categoryPair.value) ?? .art
		return (category == .science ? "science_address/" : "art_address/") + pathPair.value
	}
	
	func parse(a: Int) {
		
	}
}

let pairsCaseChanger = PairsCaseChanger()
let pairsChangedCase = pairsCaseChanger(category: "science", string: "math")
print(pairsChangedCase)
