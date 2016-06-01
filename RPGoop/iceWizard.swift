//
//  iceWizard.swift
//  RPGoop
//
//  Created by Daniel Stagnaro on 5/31/16.
//  Copyright © 2016 Daniel Stagnaro. All rights reserved.
//

import Foundation

class IceWizard: Enemy {
    override var loot: [String] {
        return ["an Ice Wand", "an Ice Amulet", "some Salted Pork", "Lightning Braclets"]
    }
    
    override var type: String {
        return "Ice Wizard"
    }
}
