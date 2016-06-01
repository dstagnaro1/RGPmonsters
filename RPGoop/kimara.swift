//
//  kimara.swift
//  RPGoop
//
//  Created by Daniel Stagnaro on 5/31/16.
//  Copyright © 2016 Daniel Stagnaro. All rights reserved.
//

import Foundation

class Kimara: Enemy {
    
    let IMMUNE_MAX = 0
    
    override var loot: [String] {
        return ["a Tough Hide", "Kimara Venom", "a Rare Trident", "a Gold Necklace"]
    }
    
    override var type: String {
        return "Kimara"
    }
    
    override func attemptAttack(attackPower: Int) -> Bool {
        if attackPower >= IMMUNE_MAX{
            return super.attemptAttack(attackPower)
        } else {
            return false
        }
    }
}

