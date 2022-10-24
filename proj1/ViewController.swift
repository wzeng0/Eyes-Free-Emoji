//
//  ViewController.swift
//  proj1
//
//  Created by William Zeng on 10/18/22.
//

import UIKit
import AudioToolbox
class ViewController: UIViewController {
    
// adding a comment here to see if it lets me push 
//    Button for trial 1
    private let button1: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("Start Set 1", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()

//    Button for trial 2
    private let button2: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("Start Set 2", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
        }()
    
//    Loading View
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Background Default Color of Blue (just for now)
        view.backgroundColor = .systemBlue
        
//        Adding button for experimental design 1
        view.addSubview(button1)
        button1.addTarget(self, action: #selector(didTapButton1), for: .touchUpInside)
        
//        Adding button for experimental design 2
        view.addSubview(button2)
        button2.addTarget(self, action: #selector(didTapButton2), for: .touchUpInside)
    }
    
//    What to do when button 1 is tapped
    @objc func didTapButton1() {
//        Tried changing background color
        view.backgroundColor = colors.randomElement()
//          Running the Trail Function
//        set1(numTrials: 6)
    }
    
//    What to do when button 2 is tapped
    @objc func didTapButton2() {
//        Tried changing background color
        view.backgroundColor = colors.randomElement()
//          Running the Trail Function
//        set1(numTrials: 6)
    }
    
    
//    Sub Layout view, the view screen is smaller than the main view layout screen
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
//        Dimensions of button 1
        button1.frame = CGRect(x: 30,
                              y: view.frame.size.height - 150 - view.safeAreaInsets.bottom,
                              width: view.frame.size.width - 260,
                              height: 55
        )

//        Dimensions of button 2
        button1.frame = CGRect(x: 200,
                                y: view.frame.size.height - 150 - view.safeAreaInsets.bottom,
                                width: view.frame.size.width - 260,
                                height: 55
                )
    }
    
//    Screen Colors for every emotions
    let colors: [UIColor] = [
        .systemBlue,
        .systemRed,
        .systemGreen,
        .systemMint,
        .systemYellow,
        .systemPurple
    ]
    
//    Trial 1 with standard vibration each representing a different Emotion
    func set1(numTrials: Int) -> Void {
        let seconds = 4.0
        var val = 0
        var frequency = [1, 2, 3, 4, 5, 6]
        
        while (val < numTrials) {
            let randomName = frequency.randomElement()!
            for _ in 0...(randomName - 1) {
                AudioServicesPlaySystemSound(SystemSoundID(4095))
                Thread.sleep(forTimeInterval: 1)
            }
            if let index = frequency.firstIndex(of: randomName) {
                frequency.remove(at: index)
//                view.backgroundColor = colors[index]
                print("Index of '\(randomName)' is \(index).")
            }
            Thread.sleep(forTimeInterval: seconds)
            val += 1
        }
    }
}
