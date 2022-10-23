//
//  ViewController.swift
//  proj1
//
//  Created by William Zeng on 10/18/22.
//

import UIKit
import AudioToolbox
class ViewController: UIViewController {
    
    private let button1: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("Start Set 1", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    private let button2: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("Start Set 1", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        // do any additional setup after loading the view.
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        view.addSubview(button1)
        view.addSubview(button2)
        button1.addTarget(self, action: #selector(didTapButton1), for: .touchUpInside)
        button2.addTarget(self, action: #selector(didTapButton2), for: .touchUpInside)
    }
    
    @objc func didTapButton1() {
        set1(numTrials: 6)
    }
    @objc func didTapButton2() {
        set1(numTrials: 6)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button1.frame = CGRect(x: 30,
                              y: view.frame.size.height - 150 - view.safeAreaInsets.bottom,
                              width: view.frame.size.width - 260,
                              height: 55
        )
        button2.frame = CGRect(x: 30,
                              y: view.frame.size.height - 150 - view.safeAreaInsets.bottom,
                              width: view.frame.size.width - 260,
                              height: 55
        )
    }
    
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
                print("Index of '\(randomName)' is \(index).")
            }
            Thread.sleep(forTimeInterval: seconds)
            val += 1
        }
    }
}
