//
//  Helpers.swift
//  Text Adventure
//
//  Created by admin on 1/8/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

func getRando(_ upperLimit : Int) -> Int {
    return Int.random(in: 0...upperLimit)
    //Int(arc4random_uniform(upperLimit))
}


struct Addition {
  var name = String()
  var type = String()
  var protection = Int()
  var strength = Int()
  var accuracy = Int()
}