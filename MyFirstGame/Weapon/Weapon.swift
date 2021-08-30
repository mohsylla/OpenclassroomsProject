//
//  Weapon.swift
//  MyFirstGame
//
//  Created by ledon on 20/07/2021.
//

import Foundation

// Classe principale de toutes les armes
class Weapon {
    
    var lifeUp: Int
    var damageUp: Int
    var healUp: Int

    var damage: Int
    
    init(damage: Int, lifeUp: Int, damageUp: Int, healUp: Int) {
        self.damage = damage
        self.lifeUp = lifeUp
        self.damageUp = damageUp
        self.healUp = healUp
    }
}

class Sword: Weapon {
    
    init() {
        super.init(damage:0, lifeUp: 20, damageUp: 20, healUp: 0)
    }
}


class Hache: Weapon {
    
    init() {
        super.init(damage:0, lifeUp: 10, damageUp: 30, healUp: 0)
    }
}



class MagicWand: Weapon {
    
    // le mage a besoin de guérir, nous créons donc une var WeaponHeal, et initilisons son dommage à zéro
    var weaponHeal = 20
    
    init() {
        super.init(damage: 0, lifeUp: 0, damageUp: 0, healUp: 0)
    }
}

class Katana: Weapon {
    
    init() {
        super.init(damage: 60, lifeUp: 20, damageUp: 0, healUp: 0)
    }
}


class Chest {
    
    // créer une var de type Arme qui contient la Baguette ou le Katana
    var weapon: Weapon
    
    init(selectedCharacter: Character) {
        if let selectedCharacter = selectedCharacter as? Magus {
            print("Le mage \(selectedCharacter.name) recoit un baguette, et s'en équipe")
            weapon = MagicWand()
        } else {
            print("\(selectedCharacter.name) recoit un Katana, et s'en équipe")
            weapon = Katana()
        }
    }
}
