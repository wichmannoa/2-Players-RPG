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

    @IBOutlet weak var lblplayer2Wins: UILabel!
    @IBOutlet weak var lblplayerWins: UILabel!
    
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
    @IBOutlet weak var lblResult: UILabel!
    
    @IBOutlet weak var lblPlayAgain: UILabel!
    @IBOutlet weak var btnPlayAgain: UIButton!
    @IBOutlet weak var btnAttack: UIButton!
    //Create it out here, initialize it on the viewDidLoad
    var player: Player!
    var player2: Player!
    var btnSound: AVAudioPlayer!
    var counter = 0
    var p1Wins = 0
    var p2Wins = 0
    var diceRoll = 0;
    var baseHp = 0
    var baseHp2 = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Sound
        let path = NSBundle.mainBundle().pathForResource("punch2", ofType: "wav")
        let soundUrl = NSURL(fileURLWithPath: path!)
        do{
            try btnSound = AVAudioPlayer(contentsOfURL: soundUrl)
                btnSound.prepareToPlay()
        }
        catch let err as NSError{
                print(err.debugDescription)
        }

        //Create player  1
        player = Player(name: "Stinx", hp: 10, atckPwr: 10)
        baseHp = player.hp
        lblHp.text = "HP: \(player.hp)"
        lblXp.text = "XP: \(player.totalXp)"
        lblName.text = "N: \(player.name)"
        lblLvl.text = "Lvl: \(player.lvl)"
        
        //Create player 2
        player2 = Player(name: "Soldier", hp: 10, atckPwr: 10)
        baseHp2 = player2.hp
        lblHp2.text = "HP: \(player2.hp)"
        lblXp2.text = "XP: \(player2.totalXp)"
        lblName2.text = "N: \(player2.name)"
        lblLvl2.text = "Lvl: \(player2.lvl)"
    }
    
    @IBAction func onAttackTapped(sender: AnyObject) {
        //Get random modifier
        diceRoll = Int(arc4random_uniform(6) + 1)
        //Play sound
        playSound();
        //Who's turn is it?
        if counter % 2 == 0{
            player2.attempAttack(player.attackPower + player.lvl - diceRoll)
            lblHp2.text = "HP: \(player2.hp)"
            lblTurn.text = "\(player2.name) Attack!"
            lblRoll.text = "\(diceRoll)"
        }else{
            player.attempAttack(player2.attackPower + player2.lvl - diceRoll)
            lblHp.text = "HP: \(player.hp)"
            lblTurn.text = "\(player.name) Attack!"
            lblRoll.text = "\(diceRoll)"
        }
        counter++
        //Block attack button for .5 seconds
        self.btnAttack.enabled = false
        NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "enableButton", userInfo: nil, repeats: false)
        
        if !player.isAlive || !player2.isAlive {
            if !player.isAlive{
                lblResult.text = "\(player.name) is dead!"
                lblplayer2Wins.text = "Wins: \(++p2Wins)"
                player2.gainXp(Double(player.lvl) / Double(10.0))
                lblXp2.text = "XP: \(player2.currentXp)"
                lblLvl2.text = "Lvl: \(player2.lvl)"
                btnPlayAgain.hidden = false
                lblPlayAgain.hidden = false;
            }else{
                lblResult.text = "\(player2.name) is dead!"
                lblplayerWins.text = "Wins: \(++p1Wins)"
                player.gainXp(Double(player2.lvl) / Double(10.0))
                lblXp.text = "XP: \(player.currentXp)"
                lblLvl.text = "Lvl: \(player.lvl)"
                btnPlayAgain.hidden = false
                lblPlayAgain.hidden = false;
            }
        }
        //player.gainXp(Double(player.lvl) / Double(10.0))
        //lblXp.text = "XP: \(player.currentXp)"
        //lblLvl.text = "Lvl: \(player.lvl)"
    }
    
    @IBAction func onPlayAgainTapped(sender: AnyObject) {
        playAgain()
    }
    func playAgain(){
        lblPlayAgain.hidden = true;
        btnPlayAgain.hidden = true;
        lblResult.text = ""
        player.hp = baseHp
        lblHp.text = "HP: \(baseHp)"
        player2.hp = baseHp2
        lblHp2.text = "HP: \(baseHp2)"
    }
    
    func playSound(){
        if btnSound.playing{
            btnSound.stop()
        }
        btnSound.play()
    }
    //Callback for button block
    func enableButton() {
        self.btnAttack.enabled = true
    }



}

