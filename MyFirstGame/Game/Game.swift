//
//  Game.swift
//  MyFirstGame
//
//  Created by ledon on 20/07/2021.
//

import Foundation

class Game {
    var tours = 0
    var personne = ""
    // Creation du player 1
    var player1: Player
    
    // Creation du Player 2
    var player2: Player

    init() {
        player1 = Player(name: "Joueur 1")
        player2 = Player(name: "Joueur 2")
    }
    
    func startGame(){
        //introduction
        introduction()
        //creation des equipes
        createTeams()
        // Lancer les combats au tour par tour
        startBattle()
        
    }
    
    func introduction(){
        print("Bienvenue!"
        + "\n pour pouvoir jouer au jeux chaque joueur choisit 3 personnage, puis chaque joueur attaque au tour a tour en choisissant le perso qui recevra les degats."
        + "\n lorsqu'un joueur ne possede plus de personnage le jeux est finis")
    }
    
    // func chaque joueur crée une equipe de 3 personnage
    func createTeams() {
        print("\(player1.name) choisit son équipe de trois personnages")
        player1.chooseTeam()
        
        print("\(player2.name) choisit son équipe de trois personnages")
        player2.chooseTeam()
    }
    

    func startBattle() {
        print("\nMaintenant que vous avez constitués vos deux équipes, le jeu peut commencer!!!\n")
        
        while player1.characters.count != 0 || player2.characters.count != 0  {
            print("\(player1.name) choisit un personnage de son équipe, puis un personnage ennemis à attaquer, ou allié à soigner dans le cas du mage.")
            player1.teamView()
            
            let ownCharacter = player1.selectCharacter(characters: player1.characters, selectedCharacter: nil)
            checkChest(selectedCharacter: ownCharacter)
            
            let opponentCharacter =  player1.selectCharacter(characters: player2.characters, selectedCharacter: ownCharacter)
            ownCharacter.attack(target: opponentCharacter)
            tours += 1
            
            player2.checkTeamLife()
            if displayWinner() == true {
                break
            }
            
            swap(&player1, &player2)
        }
        
        print("Le jeu est terminé")
        print("Bravo !")
        
    }
    
    // func qui vérifie si un joueur gagne (si un joueur n'a pas de personnage dans son tableau, il a perdu
    func displayWinner()->Bool{
        print("vous avez gagner en \(tours) tours")
        if player2.characters.isEmpty {
            print("Victoire du Player1")
            print("Le joueur 2 n'a plus de personnages dans son équipe voici les perso mort du Player 2 :")
            
            for character in player2.charactersDead {
                print("\(character.name), \(character.typeName) (\(character.life)PV,\(character.damage)DGT)\n")
            }
            print("Le joueur 1 a gagné! le ou les survivants sont :")
            for character in player1.characters {
                print("\(character.name), \(character.typeName) (\(character.life)PV,\(character.damage)DGT)\n")
            }
            print("les perso mort sont :")
            for character in player1.charactersDead {
                print("\(character.name), \(character.typeName) (\(character.life)PV,\(character.damage)DGT)\n")
            }
            
            return true
        }
        
        if player1.characters.isEmpty {
            print("Victoire du Player2")
            print("Le joueur 1 n'a plus de personnages dans son équipe voici les perso mort du Player 1 :")
            
            for character in player1.charactersDead {
                print("\(character.name), \(character.typeName) (\(character.life)PV,\(character.damage)DGT)\n")
            }
            print("Le joueur 2 a gagné! le ou les survivants sont :")
            for character in player2.characters {
                print("\(character.name), \(character.typeName) (\(character.life)PV,\(character.damage)DGT)\n")
            }
            print("les perso mort sont :")
            for character in player2.charactersDead {
                print("\(character.name), \(character.typeName) (\(character.life)PV,\(character.damage)DGT)\n")
            }
            
            return true
        }
        return false
    }
    
    // func qui crée un nombre aléatoire. Si le joueur a de la chance, son personnage ouvre le coffre avec openChest()
    func checkChest(selectedCharacter: Character) {
        let randomNumber = Int(arc4random_uniform(10))
        
        if randomNumber == 0 {
            let newChest = Chest(selectedCharacter: selectedCharacter)
            selectedCharacter.openChest(chest: newChest)
        }
    }

}
