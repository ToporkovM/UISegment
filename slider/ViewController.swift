//
//  ViewController.swift
//  slider
//
//  Created by max on 26.11.2019.
//  Copyright © 2019 MaxT. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let sliderGo = UISlider()
    let play = UIButton()
    let pause = UIButton()
    let sliderMute = UISlider()
    var player = AVAudioPlayer()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.sliderGo.frame = CGRect(x: 0, y: 0, width: 200, height: 23)
        self.sliderGo.center = self.view.center
        self.sliderGo.minimumValue = 0.0
        self.sliderGo.maximumValue = 100.0
        self.view.addSubview(sliderGo)
        self.sliderGo.addTarget(self, action: #selector(sliderGoChange(sender:)), for: .valueChanged)
                
        do {
            if let audioPath = Bundle.main.path(forResource: "123", ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                sliderGo.maximumValue = Float(player.duration)
                print("\(player.duration)")
            }
        } catch  {
            print("error")
        }
    }
    @objc func sliderGoChange(sender: UISlider) {
        if sender.isEqual(sliderGo) {
            self.player.currentTime = TimeInterval(sender.value)
            self.player.play()
            
        }
        
    }
    
    @IBAction func stopAction(_ sender: Any) {
        player.play()
    }
    
    @IBAction func playAction(_ sender: Any) {
        player.stop()
    }
}

