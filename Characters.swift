//
//  Characters.swift
//  Two Players RPG
//
//  Created by Otto on 3/3/16.
//  Copyright © 2016 Otto. All rights reserved.
//

import Foundation

class Characters {
    private var _hp = 0;
    private var _attackPower = 0;
    private var _name = "";
    
    var attackPower: Int{
        get{
            return _attackPower
        }
        set{
            _attackPower = newValue
        }
    }
    
    var hp: Int{
        get{
            return _hp
        }
        set{
            _hp = newValue
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
    
    var isAlive: Bool{
        get{
            if _hp <= 0 {
                return true
            }else{
                return false
            }
        }
    }
    
    init(startingHp: Int, attackPwr: Int, name: String){
        self._hp = startingHp
        self._attackPower = attackPwr
        self.name = name
    }
    
 
    

    
    
}//end of Characters class