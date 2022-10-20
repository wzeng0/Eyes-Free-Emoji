//
//  ViewController.swift
//  proj1
//
//  Created by William Zeng on 10/18/22.
//

import UIKit
import AudioToolbox
class ViewController: UIViewController {
    
    let seconds = 4.0
    var val = 0
    let frequency = [1, 2, 3, 4, 5, 6]

        override func viewDidLoad() {
            // do any additional setup after loading the view.
            super.viewDidLoad()
            view.backgroundColor = .systemBlue
            while (val < 6) {
                let randomName = frequency.randomElement()!
                for _ in 0...randomName {
                    AudioServicesPlaySystemSound(SystemSoundID(4095))
                    Thread.sleep(forTimeInterval: 1)
                }
                Thread.sleep(forTimeInterval: 5)
                val += 1
            }
        }
}
