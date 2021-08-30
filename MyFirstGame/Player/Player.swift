//
//  Player.swift
//  MyFirstGame
//
//  Created by ledon on 20/07/2021.
//

import Foundation

class Player{
    
    // Chaque joueur a un nom, "Joueur 1" et "Joueur 2"
    var name: String
    
    // tableau contenant les perso de chaque equipe
    var characters: [Character] = []
    var charactersDead: [Character] = []
    
    init(name: String) {
        self.name = name
    }
    
    // liste des personnage du jeu.
    func charactersList() {
        print("\nVous avez actuellement \(characters.count) personnage(s) dans votre équipe (\(characters.count)/3)\n")
        print(""
            + "\n1. Rentrer 1 pour choisir un warrior (100HP;10DGT)"
            + "\n2. Rentrer 2 pour choisir un Colosse (150HP;5DGT)"
            + "\n3. Rentrer 3 pour choisir un Nain (80HP;15DGT)"
            + "\n4. Rentrer 4 pour choisir un Mage (75HP;10SOIN)\n"
        )
    }
    
    // Première étape de chaque joueur, cette fonction crée le personnage (combattant, colosse, etc...) et le nomme
    func chooseCharacter() {
        if let readline = readLine() {
            if let choice = Int(readline) {
                switch choice {
                    
                case 1:
                    //creation de l'instance
                    let warrior = Warrior()
                    
                    warrior.namedCharacter()
                    if warrior.validateCharacterName(arrayOfCharacters: self.characters) == true {
                        characters.append(warrior)
                    }
                    
                case 2:
                    let colossus = Colossus()
                    
                    colossus.namedCharacter()
                    if colossus.validateCharacterName(arrayOfCharacters: self.characters) == true {
                        characters.append(colossus)
                    }
                    
                case 3:
                    let dwarf = Dwarf()
                    
                    dwarf.namedCharacter()
                    if dwarf.validateCharacterName(arrayOfCharacters: self.characters) == true {
                        characters.append(dwarf)
                    }
                    
                case 4:
                    let magus = Magus()
                    
                    magus.namedCharacter()
                    if magus.validateCharacterName(arrayOfCharacters: self.characters) == true {
                        characters.append(magus)
                    }
                    
                default:
                    print("Vous vous êtes trompé\n")
                }
            }
        }
    }
    
    // tfonction qui montre les perso de l'equipe (name, typename, life and domages)
    func teamView() {
        print("Voici les trois personnages :")
        
        for character in characters {
            print("\(character.name), \(character.typeName) (\(character.life)PV,\(character.damage)DGT)\n")
        }
    }
    
    //func qui crée l'équipe de chaque joueur et le montre
    func chooseTeam() {
        let maxCharacter = 3
        
        while characters.count < maxCharacter {
            charactersList()
            chooseCharacter()
        }
        
        teamView()
    }
    
    // Sélectionne un personnage dans la propre équipe de chaque joueur, puis le personnage qui recevra les degats en retour.
    func selectCharacter(characters: [Character], selectedCharacter: Character?) -> Character {
        var perso = Character(name: "", damage: 0, life: 0, typeName: "")
        var addition = 1
        var characterSelected = false
        var tmpCharacters = characters
   
        if let mageCharacter = selectedCharacter as? Magus {
            print("Veuillez choisir un joueur de votre équipe à soigner avec votre mage \(mageCharacter.name):")
            tmpCharacters = self.characters
        } else if selectedCharacter != nil {
            print("Veuillez maintenant choisir un joueur de l'équipe adverse :")
        }
        
        for character in tmpCharacters {
            print("Veuillez rentrer \(addition) pour \(character.name), \(character.typeName)")
            addition += 1
        }
        
        while characterSelected == false {
            if let readline = readLine() {
                if let choice = Int(readline) {
                    if choice <= 3 && choice >= 1 {
                        perso = tmpCharacters[choice - 1]
                        characterSelected = true
                    } else {
                        print("Le numero du personnage choisit doit être comprit entre 1 et 3")
                    }
                }
            }
        }
        
        return perso
    }

    // function qui vérifie si un personnage est mort et le supprime s'il l'est.
    func checkTeamLife() {
        var incremention = 0
        
        for _ in characters {
            if characters[incremention].life <= 0 {
                print("\(characters[incremention].name) n'a plus de vie... Il meurt !")
                let dead = characters.remove(at: incremention)
                charactersDead.append(dead)
                break
            } else {
                print("")
            }
            
            incremention += 1
        }
    }
    
}
