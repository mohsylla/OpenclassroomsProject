//
//  Character.swift
//  MyFirstGame
//
//  Created by ledon on 20/07/2021.
//

import Foundation

class Character {
    
    // Paramètres pour tous les perso
    var life: Int
    var damage: Int
    var name: String
    var typeName: String
    var weapon: Weapon?
    
    init(name: String, damage: Int, life: Int, typeName: String) {
        self.name = name
        self.damage = damage
        self.life = life
        self.typeName = typeName
    }
    
    // Choisir le nom des personnage
    func namedCharacter() {
        print("\nVeuillez donner un nom à votre \(typeName) :\n")
        
        if let characterName = readLine() {
            name = characterName
            chooseWeapon()
        }
    }
    
    // Cette fonction recherche si le nom du personnage est unique
    func validateCharacterName(arrayOfCharacters : [Character]) -> Bool {
        for character in arrayOfCharacters {
            if character.name == name {
                print("Vous vous êtes trompés, veuilez en choisir un autre")
                return false
            }
        }
        
        print("\nLe \(typeName), du nom de \(name) dispose de \(life)HP et \(damage)DGT\n")
        return true
    }
    
    // Ouvrir le coffre et donner au personnage une épée
    func openChest(chest : Chest) {
        weapon = chest.weapon
        print("Grâce à mon épée, les nouveaux dégats s'élèvent à \(damage + chest.weapon.damage)DGT")
    }
    
    // le personnage attaque la cible, on ajoute les dégâts de l'épée s'il en a une
    func attack(target: Character) {
        print("\(name), attaque \(target.name)")
        
        if let characterWeapon = weapon {
            target.life = target.life - (damage + characterWeapon.damage)
            print("\(target.name) perd \(damage + characterWeapon.damage)HP")
        } else {
            target.life = target.life - damage
            print("\(target.name) perd \(damage)HP")
        }
    }
    
    // func qui donne le choix des armes
    func chooseWeapon() {
            var weapon: Weapon
            
            if let selectCharacter = self as? Magus {
                print("Félicitations, vous recevez une baguette")
                weapon = MagicWand()
                selectCharacter.heal = selectCharacter.heal + weapon.healUp
                
            } else {
                print("Veuillez choisir entre une épee qui boost l'attaque de votre \(typeName) (20DGT) est augmente la sante de (10HP) ou une hache qui boost l'attaque de (30HP) est augmente la sante de (10HP)")
                print("Entrez 1 pour une Epée")
                print("Entrez 2 pour une Hache")
                
                if let readline = readLine() {
                    if let choice = Int(readline) {
                        switch choice {
                            
                        case 1 : print("Félicitations, vous avez choisis une Epée")
                        weapon = Sword()
                        self.damage = self.damage + weapon.damageUp
                        self.life = self.life + weapon.damageUp
                            
                        case 2 : print("Félicitation, vous avez choisis une Hache")
                        weapon = Hache()
                        self.life = self.life + weapon.damageUp
                        self.damage = self.damage + weapon.damageUp
                            
                        default:
                            print("Vous vous êtes trompés")
                        }
                    }
                }
            }
        }
    
}



