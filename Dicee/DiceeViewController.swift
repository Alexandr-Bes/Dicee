//
//  DiceeViewController.swift
//  Dicee
//
//  Created by Alexandr on 1/9/19.
//  Copyright © 2019 Alex Industries. All rights reserved.
//

import UIKit
import AudioToolbox
import AVFoundation

class DiceeViewController: UIViewController {

    let diceArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]

    var randomDiceValue1 = 0
    var randomDiceValue2 = 0
    var audioPlayer: AVAudioPlayer!

    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        updateDiceImages()

    }


    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        playSound()
        updateDiceImages()
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        updateDiceImages()
    }

    func updateDiceImages() {

        randomDiceValue1 = Int.random(in: 0...5)
        randomDiceValue2 = Int.random(in: 0...5)

        diceImageView1.image = UIImage(named: diceArray[randomDiceValue1])
        diceImageView2.image = UIImage(named: diceArray[randomDiceValue2])
    }

    func playSound() {
        let soundURL = Bundle.main.url(forResource: "dice_roll", withExtension: "mp3")

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        }
        catch {
            print(error)
        }
        audioPlayer.play()
    }


}

