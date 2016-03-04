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
    private var _lvl = 1
    private var _currentXp = 0.0
    private var _totalXp = 0.0
    
    
    var totalXp: Double{
        get{
            return _totalXp
        }
        set{
            _totalXp = newValue
        }
    }
    
    var currentXp: Double{
        get{
            return _currentXp
        }
        set{
            _currentXp = newValue
        }
    }
    var lvl: Int{
        return _lvl
    }
    
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
    
    func gainXp(xp: Double){
        _currentXp += xp
        _totalXp += xp
        if  ((Double(_lvl) * (Double(_lvl))) - _totalXp) <= 0 {
            _lvl += 1
            _currentXp = 0
        }
    }
    
}