//
//  Heroes.swift
//  Text Adventure
//
//  Created by admin on 1/8/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

// setup adventurer class
class Adventurer {
    
    var name : String
    var hitPoints : Int
    var damage : Int
    var hitRate : Double
    
    init() {
        self.name = ""
        self.hitPoints = 100
        self.damage = 0
        self.hitRate = 0
    }
    
    func status(damageChange: Int, accuChange: Int) { //returns status
        self.damage += damageChange
        self.hitRate = self.hitRate * Double(accuChange)
        print("Hero Name: \(self.name)")
        print("Hit Points Remaining: \(self.hitPoints)")
        print("Damage: \(self.damage)")
        print("Hit Chance: \(self.hitRate)")
        //artificial display, change back so next display wont add on, addition function done elsewhere
        self.damage -= damageChange
        self.hitRate = self.hitRate / Double(accuChange)
    }
    
    
    func attack(guess: Double, accuracy: Int) -> Bool { //returns true if hits

        var didHit = false
        let threshold = self.hitRate * Double(accuracy) * 100 / 2
        let randAttack = Double(getRando(100))
        var lowest = randAttack - threshold
        var highest = randAttack + threshold

        //if guess is within a certain range of the randomly generated number
        if highest > 100 {
          lowest = 100 - (threshold * 2)
          highest = 100
        } else if lowest < 0 {
          lowest = 0
          highest = threshold * 2
        }
        
        if guess >= lowest && guess <= highest {
          didHit = true
        }

        print("You needed between \(lowest) and \(highest)")

        if didHit {
            print("You hit!")
            return true
        } else {
            print("You missed!")
            return false
        }
        
    }

    func wasHit(damage: Int) -> Bool { //return true if dead
        hitPoints = hitPoints - damage
        if hitPoints <= 0 {
          return true
        } else {
          return false
        }
        
    }
}// end adventurer


// define adenturer subclasses
class Warrior : Adventurer {
    
    override init() {
        super.init()
        self.damage = 15
        self.hitRate = 0.30
    }

}

class Mage : Adventurer {
 
    override init() {
        super.init()
        self.damage = 20
        self.hitRate = 0.20
    }
}

class Rogue : Adventurer {
    
    override init() {
        super.init()
        self.damage = 10
        self.hitRate = 0.40
    }
    
}

