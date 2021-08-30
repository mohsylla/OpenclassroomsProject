//
//  Magus.swift
//  MyFirstGame
//
//  Created by ledon on 20/07/2021.
//

import Foundation

class Magus: Character {
    
    // nous créons la guérison
    var heal: Int = 10
    
    init() {
        super.init(name: "Magus", damage: 0, life: 75, typeName: "Magus")
    }
    
    // nous écrivons la propre version de l'openChest, pour donner au mage une baguette
    override func openChest(chest: Chest) {
        weapon = chest.weapon
    
        if let magicwand = weapon as? MagicWand {
            print("Grâce à mon Baton, mes nouveaux soins s'élèvent à \(self.heal + magicwand.weaponHeal)")
        }
    }
    
    // Le mage soignera la cible (qui est un personnage de l'équipe de mage)
    override func attack(target: Character) {
        print("\(name), soigne \(target.name)")
        
        if let characterWeapon = weapon as? MagicWand {
            target.life = target.life + (self.heal + characterWeapon.weaponHeal)
            print("\(target.name) gagne \(self.heal + characterWeapon.weaponHeal)HP")
        } else {
            target.life = target.life + self.heal
            print("\(target.name) gagne \(self.heal)HP")
        }
    }
}
