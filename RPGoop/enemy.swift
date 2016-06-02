//
//  enemy.swift
//  RPGoop
//
//  Created by Daniel Stagnaro on 5/31/16.
//  Copyright © 2016 Daniel Stagnaro. All rights reserved.
//

import Foundation

class Enemy: Character {
    
    var loot: [String] {
        return ["a Rusty Boot", "a Cracked Buckler", "a Broken Sword", "a Silver Gun"]
    }
    
    var type: String {
        return "Grunt"
    }
    
    func dropLoot() -> String? {
        
//        if !isAlive {
//            let rand = Int(arc4random_uniform(UInt32(loot.count)))
//            return loot[rand]
//        }
        
        if isDead {
            let rand = Int(arc4random_uniform(UInt32(loot.count)))
            return loot[rand]
        }
        
        return nil
    }
    
}