//
//  player.swift
//  RPGoop
//
//  Created by Daniel Stagnaro on 5/31/16.
//  Copyright © 2016 Daniel Stagnaro. All rights reserved.
//

import Foundation

class Player: Character{
    
    private var _name = ""
    
    var name: String {
        get {
            return _name
        }
    }
    
    private var _inventory = [String]()
    
    var inventory: [String]{
        return _inventory
    }
    
    func addItemToInventory(item: String) {
        _inventory.append(item)
    }
    
    convenience init(name: String, hp: Int, attackPower: Int) {
        self.init(startingHP: hp, attackPower: attackPower)
        
        _name = name
    }
    
}