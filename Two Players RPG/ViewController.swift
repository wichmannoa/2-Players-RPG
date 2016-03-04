//
//  ViewController.swift
//  Two Players RPG
//
//  Created by Otto on 3/3/16.
//  Copyright © 2016 Otto. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {

    
    @IBOutlet weak var lblLvl: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblXp: UILabel!
    @IBOutlet weak var lblHp: UILabel!
    
    
    @IBOutlet weak var lblName2: UILabel!
    @IBOutlet weak var lblHp2: UILabel!
    @IBOutlet weak var lblLvl2: UILabel!
    @IBOutlet weak var lblXp2: UILabel!
    
    @IBOutlet weak var lblTurn: UILabel!
    @IBOutlet weak var lblRoll: UILabel!
    
    @IBOutlet weak var btnAttack: UIButton!
    //Create it out here, initialize it on the viewDidLoad
    var player: Player!
    var player2: Player!
    var btnSound: AVAudioPlayer!
    var counter = 0
    var diceRoll = 0;
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = NSBundle.mainBundle().pathForResource("tripplePunch", ofType: "wav")
        let soundUrl = NSURL(fileURLWithPath: path!)
        
        do{
            try btnSound = AVAudioPlayer(contentsOfURL: soundUrl)
            btnSound.prepareToPlay()
        }catch let err as NSError{
            print(err.debugDescription)
        }

        
        player = Player(name: "Stinx", hp: 110, atckPwr: 10)
        
        lblHp.text = "HP: \(player.hp)"
        lblXp.text = "XP: \(player.totalXp)"
        lblName.text = "N: \(player.name)"
        lblLvl.text = "Lvl: \(player.lvl)"
        
        player2 = Player(name: "Soldier", hp: 110, atckPwr: 10)
        
        lblHp2.text = "HP: \(player2.hp)"
        lblXp2.text = "XP: \(player2.totalXp)"
        lblName2.text = "N: \(player2.name)"
        lblLvl2.text = "Lvl: \(player2.lvl)"
    }
    
    @IBAction func onGainExpTapped(sender: AnyObject) {
        diceRoll = Int(arc4random_uniform(6) + 1)
        playSound();
        
            if counter % 2 == 0{
                player2.attempAttack(player.attackPower - diceRoll)
                lblHp2.text = "HP: \(player2.hp)"
                lblTurn.text = "\(player2.name) Attack!"
                lblRoll.text = "\(diceRoll)"
            }else{
                player.attempAttack(player2.attackPower - diceRoll)
                lblHp.text = "HP: \(player.hp)"
                lblTurn.text = "\(player.name) Attack!"
                lblRoll.text = "\(diceRoll)"
            }
        counter++
        
        
        
        //player.gainXp(Double(player.lvl) / Double(10.0))
        //lblXp.text = "XP: \(player.currentXp)"
        //lblLvl.text = "Lvl: \(player.lvl)"
       
       
    }
    
    func playSound(){
        if btnSound.playing{
            btnSound.stop()
        }
        btnSound.play()
       
    }



}

