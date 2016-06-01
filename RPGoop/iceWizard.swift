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
        return ["Ice Wand", "Ice Amulet", "Salted Pork"]
    }
    
    override var type: String {
        return "Ice Wizard"
    }
}
