//
//  main.swift
//  Zero Player Game
//
//  Created by admin on 11/19/19.
//  Copyright © 2019 admin. All rights reserved.
//


import Foundation

print("Welcome to the Dungeon!")
print("INTRO: you need to navigate through rooms where you'll encounter mosters to battle. Along the way, you may find armour, weapons, and potions. When prompted to attack, guess a number from 1-100 to strike, get lucky and you'll hit your monster! GOOD LUCK!")

//HERO SETUP
//setup array of heroes
var heroes : [Adventurer] = []
var bluto = Warrior()
bluto.name = "Bluto"
heroes.append(bluto)

var blammo = Mage()
blammo.name = "Blammo"
heroes.append(blammo)

var blippo = Rogue()
blippo.name = "Blippo"
heroes.append(blippo)

blippo.status(damageChange: 0, accuChange: 1)
bluto.status(damageChange: 0, accuChange: 1)
blammo.status(damageChange: 0, accuChange: 1)

//controls
var hero = Adventurer()
var heroIsDead = false

//MONSTER SETUP
//setup array of monsters
var monsters : [Monster] = []
var goblin = Monster(name: "Goblin", hitPoints: 20, hitRate: 0.70, damage: 10)
monsters.append(goblin)

var orc = Monster(name: "Orc", hitPoints: 25, hitRate: 0.50, damage: 10)
monsters.append(orc)

var greenSlime  = Monster(name: "Green Slime", hitPoints: 15, hitRate: 0.90, damage: 8)
monsters.append(greenSlime)

var largeBat = Monster(name: "Large Bat", hitPoints: 15, hitRate: 0.90, damage: 10)
monsters.append(largeBat)

var ogre = Monster(name: "Ogre", hitPoints: 25, hitRate: 0.60, damage: 20)
monsters.append(ogre)

var troll = Monster(name: "Troll", hitPoints: 30, hitRate: 0.20, damage: 30)
monsters.append(troll)

//controls
var currentMonster = Monster()
var randMonster = Int()
var monsterIsDead = false

//EXTRAS SETUP
//setup armors array
var armors : [Addition] = []
var goldArmor = Addition(name: "Gold Armor", type: "armor", protection: 8, strength: 0, accuracy: 1)
armors.append(goldArmor)

var chainArmor = Addition(name: "Chain Armor", type: "armor", protection: 5, strength: 0, accuracy: 1)
armors.append(chainArmor)

//setup weapons array
var weapons : [Addition] = []
var axe = Addition(name: "Axe", type: "weapon", protection: 0, strength: 5, accuracy: 1)
weapons.append(axe)

var sword = Addition(name: "Sword", type: "weapon", protection: 0, strength: 8, accuracy: 1)
weapons.append(sword)

//setup potions array
var potions : [Addition] = []
var accuPotion = Addition(name: "Accuracy Potion", type: "potion", protection: 0, strength: 0, accuracy: 2)
potions.append(accuPotion)

var healPotion = Addition(name: "Healing Potion", type: "potion", protection: 0, strength: 0, accuracy: 1)
potions.append(healPotion)

//contols
var currentAddition = Addition()
var hasArmor = false
var hasWeapon = false
var hasPotion = false   //only to see whether to print addition or "nothing"

//ROOM SETUP
var numOfRooms = Int()
var currentRooms = 0

//setup var i for random ints
var i = Int()

//END OF SETUP


//PROMPT USER TO PICK A HERO
print("CHOOSE A HERO TO BEGIN CRAWL: ")
var chosenHero = readLine()!

if chosenHero.lowercased() == "bluto" {
  hero = bluto
  print("Your hero is: Bluto")
} else if chosenHero.lowercased() == "blammo" {
  hero = blammo
  print("Your hero is: Blammo")
} else if chosenHero.lowercased() == "blippo" {
  hero = blippo
  print("Your hero is: Blippo")
} else {
  //generate random hero if not picked
  i = getRando(2)
  if i == 0 {
    hero = bluto
    print("Your (random) hero is: Bluto")
  } else if i == 1 {
    hero = blammo
    print("Your (random) hero is: Blammo")
  } else {
    hero = blippo
    print("Your (random) hero is: Blippo")
  }
}

//rename hero
print("NAME YOUR HERO (or ENTER to keep name): ")
var rename = readLine()!
if rename != "" {
  hero.name = rename
  print("Your name is now \(hero.name)!")
}

//PROMPT USER TO "PICK" ROOM
print("CHOOSE A DUNGEON TO CRAWL: ")
print("1: room 1    2: room 2   3: room 3")
var chosenRoom = readLine()!

if chosenRoom == "1" {
  numOfRooms = Int.random(in:5...7)
} else if chosenRoom == "2" {
  numOfRooms = Int.random(in:7...9)
} else if chosenRoom == "3" {
  numOfRooms = Int.random(in:9...11)
} else {
  numOfRooms = Int.random(in:5...11)
}
print("To win, you need to navigate through \(numOfRooms - 1) rooms and come out alive!")


print("LET'S BEGIN THE CRAWL!!")

//display to the user new room and generate room's monster
func newEncounter() {
  currentRooms += 1
  print("You've entered Room Number \(currentRooms)")
  if currentRooms != numOfRooms {
    monsterIsDead = false
    randMonster = getRando(5)
    currentMonster = monsters[randMonster]
    print("You've encountered \(currentMonster.name)")
  }
}

//generate a random extra
func generateExtra() {
  //sometimes give addition
  i = getRando(10)
  if i == 0 || i == 1 {
    currentAddition = armors[getRando(1)]
    hasArmor = true
    hasWeapon = false
    hasPotion = false
  } else if i == 2 || i == 3 {
    currentAddition = weapons[getRando(1)]
    hasWeapon = true
    hasArmor = false
    hasPotion = false
  } else if i == 4 || i == 5 {
    currentAddition = potions[getRando(1)]
    hasPotion = true
    hasArmor = false
    hasWeapon = false
  } else {
    hasArmor = false
    hasWeapon = false
    hasPotion = false
    currentAddition.name = ""
    currentAddition.accuracy = 1
  }
}

//display to the user their addition
func afterEncounter() {
  generateExtra()
  if hasArmor || hasWeapon || hasPotion {
    print("You got \(currentAddition.name)")
    if currentAddition.type == "armor" {
      print("You will now take \(currentAddition.protection) less damage in the next room")
      print("PRESS ENTER TO EQUIP")
      _ = readLine()!
    } else if currentAddition.type == "weapon" {
      print("You will now do \(currentAddition.strength) more damage in the next room")
      print("PRESS ENTER TO USE")
      _ = readLine()!
    } else if currentAddition.name == "Accuracy Potion" {
      print("You will have 2 times the chance to do damage")
      print("PRESS ENTER TO DRINK")
      _ = readLine()!
      //hero.hitRate = hero.hitRate * Double(currentAddition.accuracy)
    } else if currentAddition.name == "Healing Potion" {
      print("You will be healed to full health")
      print("PRESS ENTER TO DRINK")
      _ = readLine()!
      hero.hitPoints = 100
    }
  }
}

var attackNum = Double()

//hero attack function
func heroAttack() {
  print("\(hero.name) is attacking")
  if hero.attack(guess: attackNum, accuracy: currentAddition.accuracy) {
    if hasWeapon {
      monsterIsDead = currentMonster.wasHit(damage: hero.damage + currentAddition.strength)
    } else {
      monsterIsDead = currentMonster.wasHit(damage: hero.damage)
    }
    print("\(currentMonster.name) now has \(currentMonster.hitPoints) health")
  } else {
    print("\(currentMonster.name) still has \(currentMonster.hitPoints) health")
  }
}

//monster attack function
func monsterAttack() {
  print("\(currentMonster.name) is attacking")
  if currentMonster.attacks() {
    if hasArmor {
      heroIsDead = hero.wasHit(damage: currentMonster.damage - currentAddition.protection)
    } else {
      heroIsDead = hero.wasHit(damage: currentMonster.damage)
    }
    print("You now have \(hero.hitPoints) health left")
  } else {
    print("You still have \(hero.hitPoints) health")
  }
}

//make sure monster doesn't attack after dead
func attacking() {
  heroAttack()
  if !monsterIsDead {
    monsterAttack()
  }
}

//run functions in a loop while hero is alive and number of rooms isn't reached
while !heroIsDead && numOfRooms > currentRooms {

  //if room isn't the last one
  if currentRooms != numOfRooms - 1{
    afterEncounter()
  }
  
  //ask to check status of hero
  print("PRESS 'S' TO CHECK YOUR STATUS")
  let checkStat = readLine()!
  if checkStat.lowercased() == "s" {
    if !hasArmor && !hasPotion && !hasWeapon {
      hero.status(damageChange: 0, accuChange: 1)
    } else {
      hero.status(damageChange: currentAddition.strength, accuChange: currentAddition.accuracy)
    }
  }

  print("PRESS ENTER TO GO TO THE NEXT ROOM")
  _ = readLine()!

  newEncounter()

  while !monsterIsDead && !heroIsDead {
    print("ENTER A NUMBER FROM 1-100 TO ATTACK")
    attackNum = Double(readLine()!)!
    attacking()
  }
}

//CHECK HOW GAME ENDED
if !heroIsDead {
  print("YOU WIN!!!")
} else {
  print("YOU DIED! GAME OVER!")
}