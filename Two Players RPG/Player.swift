//
//  Player.swift
//  Two Players RPG
//
//  Created by Otto on 3/3/16.
//  Copyright © 2016 Otto. All rights reserved.
//

import Foundation

class Player: Characters {

    private var _name = ""
    private var _inventory = [String]()
    
    var inventory: [String]{
        get{
            return _inventory
        }
    }

    var name: String{
        get{
            return _name
        }
        set{
            _name = newValue
        }
    }
    
    convenience init( name: String, hp: Int, atckPwr: Int) {
        self.init(startingHp: hp, attackPwr: atckPwr)
        _name = name;
    }

    func addToInventory(item:String){
        _inventory.append(item)
    }
}