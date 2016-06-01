//
//  ViewController.swift
//  RPGoop
//
//  Created by Daniel Stagnaro on 5/31/16.
//  Copyright © 2016 Daniel Stagnaro. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var gameLabel: UILabel!
    
    // @IBOutlet weak var playerHealthLabel: UILabel!
    
    @IBOutlet weak var enemyHealthLabel: UILabel!
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var enemyNameLabel: UILabel!

    @IBOutlet weak var enemyImage: UIImageView!
    
    @IBOutlet weak var chestButton: UIButton!
    @IBOutlet weak var attackButton: UIButton!
    
    var player: Player!
    var enemy: Enemy!
    var chestMessage: String?
    
    var attackSound: AVAudioPlayer!
    var chestSound: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let attackPath = NSBundle.mainBundle().pathForResource("scissors", ofType: "aif")
        let chestPath = NSBundle.mainBundle().pathForResource("xylo", ofType: "aif")
        
        let attackSoundURL = NSURL(fileURLWithPath: attackPath!)
        let chestSoundURL = NSURL(fileURLWithPath: chestPath!)
        
        do {
            try attackSound = AVAudioPlayer(contentsOfURL: attackSoundURL)
            attackSound.prepareToPlay()
            try chestSound = AVAudioPlayer(contentsOfURL: chestSoundURL)
            chestSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        player = Player(name: "Ghostman", hp: 120, attackPower: 0)
        generateRandomEnemy()
    }
    
    func playAttackSound() {
        if attackSound.playing {
            attackSound.stop()
        }
        attackSound.play()
    }
    
    func playChestSound() {
        if chestSound.playing {
            chestSound.stop()
        }
        chestSound.play()
    }
    
    func newRound () {
        
        player.attackStronger()
        print("player attack power \(player.attackPower)")
        
        enemyNameLabel.text = "\(enemy.type)"
        enemyHealthLabel.text = "\(enemy.hp) HP"
        playerNameLabel.text = "\(player.name)"
        
        chestButton.hidden = true
        
        enemyImage.hidden = false
        enemyHealthLabel.hidden = false
        enemyNameLabel.hidden = false

        attackButton.hidden = false
        
        gameLabel.text = "A wild \(enemy.type) showed up!"
    }
    
    func generateRandomEnemy() {
        let rand = Int(arc4random_uniform(3))
        
        if rand == 0 {
            enemy = Kimara(startingHP: 70, attackPower: 12)
        } else if rand == 1 {
            enemy = IceWizard(startingHP: 80, attackPower: 15)
        } else {
            enemy = Enemy(startingHP: 40, attackPower: 8)
        }
        
        newRound()
    }

    @IBAction func attackTapped(sender: UIButton) {
        playAttackSound()
        
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
            enemyNameLabel.hidden = true
            attackButton.hidden = true
        }
        
    }
    
    
    @IBAction func chestTapped(sender: UIButton) {
        playChestSound()
        
        chestButton.hidden = true
        gameLabel.text = chestMessage
        
        //play xylo
        
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.generateRandomEnemy), userInfo: nil, repeats: false)
    }

}

