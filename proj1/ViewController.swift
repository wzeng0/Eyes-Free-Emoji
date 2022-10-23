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
    var frequency = [1, 2, 3, 4, 5, 6]

        override func viewDidLoad() {
            // do any additional setup after loading the view.
            super.viewDidLoad()
            while (val < 6) {
                let randomName = frequency.randomElement()!
                for _ in 0...(randomName - 1) {
                    AudioServicesPlaySystemSound(SystemSoundID(4095))
                    Thread.sleep(forTimeInterval: 1)
                }
                if let index = frequency.firstIndex(of: randomName) {
                    frequency.remove(at: index)
                    print("Index of '\(randomName)' is \(index).")
                }
                view.backgroundColor = .systemBlue
                Thread.sleep(forTimeInterval: 5)
                val += 1
            }
        }
}
