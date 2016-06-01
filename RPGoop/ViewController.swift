//
//  ViewController.swift
//  RPGoop
//
//  Created by Daniel Stagnaro on 5/31/16.
//  Copyright © 2016 Daniel Stagnaro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gameLabel: UILabel!
    
    @IBOutlet weak var playerHealthLabel: UILabel!
    @IBOutlet weak var enemyHealthLabel: UILabel!
    @IBOutlet weak var enemyImage: UIImageView!
    
    @IBOutlet weak var chestButton: UIButton!
    @IBOutlet weak var attackButton: UIButton!
    
    var player: Player!
    var enemy: Enemy!
    var chestMessage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        player = Player(name: "Ghostman", hp: 120, attackPower: 16)
        
        generateRandomEnemy()
        
        // playerHealthLabel.text = "\(player.hp) HP"
        playerHealthLabel.hidden = true
        
        enemyHealthLabel.text = "\(enemy.hp) HP"
    }
    
    func generateRandomEnemy() {
        let rand = Int(arc4random_uniform(2))
        
        if rand == 0 {
            enemy = Kimara(startingHP: 70, attackPower: 12)
        } else {
            enemy = IceWizard(startingHP: 80, attackPower: 15)
        }
        
        enemyImage.hidden = false
        attackButton.hidden = false
        gameLabel.text = "A wild \(enemy.type) showed up!"

    }

    @IBAction func attackTapped(sender: UIButton) {
        if enemy.attemptAttack(player.attackPower) {
            gameLabel.text = "\(player.name) attacked \(enemy.type) for \(player.attackPower) HP!"
            enemyHealthLabel.text = "\(enemy.hp) HP"
        } else {
            gameLabel.text = "Attack was unsuccessful!"
        }
        
        if let loot = enemy.dropLoot() {
            player.addItemToInventory(loot)
            chestMessage = "\(player.name) found \(loot)!"
            chestButton.hidden = false
        }
        
        if !enemy.isAlive {
            enemyHealthLabel.text = ""
            gameLabel.text = "\(player.name) killed \(enemy.type)!"
            enemyImage.hidden = true
            attackButton.hidden = true
        }
        
    }
    
    
    @IBAction func chestTapped(sender: UIButton) {
        chestButton.hidden = true
        gameLabel.text = chestMessage
        
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.generateRandomEnemy), userInfo: nil, repeats: false)
    }

}

