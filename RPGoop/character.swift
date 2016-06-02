//
//  character.swift
//  RPGoop
//
//  Created by Daniel Stagnaro on 5/31/16.
//  Copyright © 2016 Daniel Stagnaro. All rights reserved.
//

import Foundation

class Character {
    
    private var _hp: Int = 0
    private var _attackPower: Int = 0
    
    var attackPower: Int {
        return _attackPower
    }
    
    func attackStronger() {
        _attackPower += 1
    }
    
    var hp: Int {
        return _hp
    }
    
    var isAlive: Bool {
        get {
            if hp <= 0 {
                return false
            } else {
                return true
            }
        }
    }
    
    var isDead: Bool {
        get {
            if hp <= 0 {
                return true
            } else {
                return false
            }
        }
    }
    
    init(startingHP: Int, attackPower: Int) {
        self._hp = startingHP
        self._attackPower = attackPower
    }
    
    func attemptAttack(attackPower: Int) -> Bool {
        self._hp -= attackPower
        
        return true
    }
    
}