
enum SpellCastError: Error {
    case spellIsNotLearned
    case notEnoughMana(needMore: Int)
    case friendlyTarget
}

extension SpellCastError: CustomStringConvertible {
    var description: String {
        switch self {
            case .spellIsNotLearned: return "Spell is not learned yet!"
            case .notEnoughMana(let mana): return "Need \(mana) more"
            case .friendlyTarget: return "You can't cast this spell on friendly targets"
        }
    }
}

protocol Target { }
struct Enemy: Target { }
struct Friend: Target { }

class Mage {
    
    var mana = 0
    var spells = ["fireball" : 100]
    
    func fillMana() {
        mana = 1000
    }
    
    func castHarmSpell(onEnemy target: Target) throws {
        if target is Friend {
            throw SpellCastError.friendlyTarget
        }
        print("Cast fireball killing all enemies!")
    }
    
    func castFireball(onTarget target: Target) throws {
        if mana < spells["fireball"]! {
            throw SpellCastError.notEnoughMana(needMore: spells["fireball"]! - mana)
        }
        
        if !spells.keys.contains("fireball") {
            throw SpellCastError.spellIsNotLearned
        }
        
        print("Cast fireball again!")
    }
}

let targetF = Friend()
let targetE = Enemy()

let mage = Mage()

do {
    try mage.castHarmSpell(onEnemy: targetF)
} catch let error as SpellCastError {
    switch error {
        case .friendlyTarget: print(error.description)
        default: break
    }
}

do {
    try mage.castFireball(onTarget: targetE)
} catch SpellCastError.notEnoughMana(let mana) {
    print(SpellCastError.notEnoughMana(needMore: mana).description)
} catch SpellCastError.spellIsNotLearned {
    print(SpellCastError.spellIsNotLearned.description)
}

mage.fillMana()

do {
    try mage.castFireball(onTarget: targetE)
} catch SpellCastError.notEnoughMana(let mana) {
    print(SpellCastError.notEnoughMana(needMore: mana).description)
} catch SpellCastError.spellIsNotLearned {
    print(SpellCastError.spellIsNotLearned.description)
}

