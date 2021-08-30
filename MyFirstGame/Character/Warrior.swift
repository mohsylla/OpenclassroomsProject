//
//  Warrior.swift
//  MyFirstGame
//
//  Created by ledon on 20/07/2021.
//

import Foundation

//herite de la class character
class Warrior: Character {
    
    init() {
        super.init(name: "Combattant", damage: 10, life: 100, typeName: "Combattant")
    }
}
