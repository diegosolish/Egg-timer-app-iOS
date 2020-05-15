//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

// EDITED BY DIEGO SOLIS ON 02/21/2020
// THIS PROJECT IS FROM AN ONLINE COURSE I AM TAKING
// LAST EDIT ON 14/05/2020

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet var progressBar: UIProgressView!
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
//    Soft is 300, medium is 420 & hard is 720
    
    var player: AVAudioPlayer!
    var timer = Timer()
    var totalTime: Float = 0
    var timePassed: Float = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        timePassed = 0
        progressBar.progress = 0
        
        let hardness = sender.currentTitle!
        
        totalTime = Float(eggTimes[hardness]!)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @IBOutlet var titleLabel: UILabel!
    
    @objc func updateTimer() {
        
         if timePassed < totalTime {
            timePassed += 1
            progressBar.progress = timePassed / totalTime
            print("\(timePassed) seconds.")
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!"
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
}


