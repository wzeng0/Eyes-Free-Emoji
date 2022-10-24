//
//  ViewController.swift
//  proj1
//
//  Created by William Zeng on 10/18/22.
//

import UIKit
import AudioToolbox
class ViewController: UIViewController {
    
    var userOutput: [String] = []
    
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
        
        let gestureView = UIView(frame: CGRect(x:0, y:0, width:400, height:500))
        gestureView.backgroundColor = .red
        gestureView.center = view.center
        gestureView.isUserInteractionEnabled = true
        view.addSubview(gestureView)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(oneTap(gesture:)))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(twoTap(gesture:)))
        doubleTapGesture.numberOfTapsRequired = 2
        doubleTapGesture.numberOfTouchesRequired = 1
        let threeTapGesture = UITapGestureRecognizer(target: self, action: #selector(threeTap(gesture:)))
        threeTapGesture.numberOfTapsRequired = 3
        threeTapGesture.numberOfTouchesRequired = 1
        let fourTapGesture = UITapGestureRecognizer(target: self, action: #selector(fourTap(gesture:)))
        fourTapGesture.numberOfTapsRequired = 4
        fourTapGesture.numberOfTouchesRequired = 1
        let fiveTapGesture = UITapGestureRecognizer(target: self, action: #selector(fiveTap(gesture:)))
        fiveTapGesture.numberOfTapsRequired = 5
        fiveTapGesture.numberOfTouchesRequired = 1
        let sixTapGesture = UITapGestureRecognizer(target: self, action: #selector(sixTap(gesture:)))
        sixTapGesture.numberOfTapsRequired = 6
        sixTapGesture.numberOfTouchesRequired = 1
        
        
        
        gestureView.addGestureRecognizer(tapGesture)
        gestureView.addGestureRecognizer(doubleTapGesture)
        gestureView.addGestureRecognizer(threeTapGesture)
        gestureView.addGestureRecognizer(fourTapGesture)
        gestureView.addGestureRecognizer(fiveTapGesture)
        gestureView.addGestureRecognizer(sixTapGesture)
        
        func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
                 shouldRequireFailureOf otherGestureRecognizer: UIGestureRecognizer) -> Bool {
           // Don't recognize a single tap until a double-tap fails.
           if gestureRecognizer == tapGesture &&
                  otherGestureRecognizer == doubleTapGesture {
              return true
           }
           return false
        }
        
//        Adding button for experimental design 1
        view.addSubview(button1)
        button1.addTarget(self, action: #selector(didTapButton1), for: .touchUpInside)
        
//        Adding button for experimental design 2
        view.addSubview(button2)
        button2.addTarget(self, action: #selector(didTapButton2), for: .touchUpInside)
    }
    
    @objc func oneTap(gesture: UITapGestureRecognizer) {
        userOutput.append("happy")
        print(userOutput)
    }
    @objc func twoTap(gesture: UITapGestureRecognizer) {
        userOutput = userOutput.dropLast(1)
        userOutput.append("sad")
        print(userOutput)
    }
    @objc func threeTap(gesture: UITapGestureRecognizer) {
        userOutput = userOutput.dropLast(1)
        userOutput.append("thumbs up")
        print(userOutput)
    }
    @objc func fourTap(gesture: UITapGestureRecognizer) {
        userOutput = userOutput.dropLast(1)
        userOutput.append("thumbs down")
        print(userOutput)
    }
    @objc func fiveTap(gesture: UITapGestureRecognizer) {
        userOutput = userOutput.dropLast(1)
        userOutput.append("laugh")
        print(userOutput)
    }
    @objc func sixTap(gesture: UITapGestureRecognizer) {
        userOutput = userOutput.dropLast(1)
        userOutput.append("mad")
        print(userOutput)
    }
    
//    What to do when button 1 is tapped
    @objc func didTapButton1() {
//        Tried changing background color
        view.backgroundColor = colors.randomElement()
//          Running the Trail Function
        set1(numTrials: 6)
    }
    
//    What to do when button 2 is tapped
    @objc func didTapButton2() {
//        Tried changing background color
        view.backgroundColor = colors.randomElement()
//          Running the Trail Function
        set2(numTrials: 6)
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
        button2.frame = CGRect(x: 200,
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
    
//    Trial 2 with different vibrations each representing a different Emotion
        func set2(numTrials: Int) -> Void {
            let seconds = 4.0
            var val = 0
            var frequency = [4095, 1304, 1321, 1519, 1350, 1521]
            
            // 4095 = normal, 1521 = 3 little booms, 1321 = two
            // need to change 1350, also 1519 is very close to 1521

            while (val < numTrials) {
                let randomName = frequency.randomElement()!
                AudioServicesPlaySystemSound(SystemSoundID(randomName))
                
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
