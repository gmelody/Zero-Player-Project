//
//  Monsters.swift
//  Text Adventure
//
//  Created by admin on 1/8/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

//setup monster struct
struct Monster {
  var name = String()
  var hitPoints = Int()
  var hitRate = Double()
  var damage = Int()
    
    
  func attacks() -> Bool { //returns true if hits
        
        let hitRoll = getRando(99) + 1
        
        if Double(hitRoll) < self.hitRate * 100 {
            print("Rolled \(hitRoll), needed less than \(self.hitRate * 100)")
            print("\(currentMonster.name) hit!")
            return true
        } else {
            print("Rolled \(hitRoll), needed less than \(self.hitRate * 100)")
            print("\(currentMonster.name) missed!")
            return false
        }
  }
  
  mutating func wasHit(damage: Int) -> Bool { //return true if dead

        hitPoints = hitPoints - damage
        if hitPoints <= 0 {
          return true
        } else {
          return false
        }
        
  }

}

