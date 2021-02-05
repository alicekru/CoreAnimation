//
//  ViewController.swift
//  RedCircle
//
//  Created by Alice Krutienko on 02.02.2021.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties

    @IBOutlet weak var dotView: UIView!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        dotView.layer.cornerRadius = dotView.frame.height / 2
        dotView.clipsToBounds = true
    }
    
    @IBAction func startBtnTapped(_ sender: UIButton) {
        let pulse = PulseAnimation(numberOfPulse: Float.infinity, radius: 200, position: dotView.center)
        pulse.animationDuration = 0.8
        pulse.backgroundColor = UIColor.red.withAlphaComponent(0.2).cgColor
        self.view.layer.insertSublayer(pulse, below: self.view.layer)
        
        let littlePulse = PulseAnimation(numberOfPulse: Float.infinity, radius: 70, position: dotView.center)
        littlePulse.animationDuration = 0.8
        littlePulse.backgroundColor = UIColor.red.withAlphaComponent(0.6).cgColor
        self.view.layer.insertSublayer(littlePulse, below: self.view.layer)
        
        let middlePulse = PulseAnimation(numberOfPulse: Float.infinity, radius: 170, position: dotView.center)
        middlePulse.animationDuration = 0.7
        middlePulse.backgroundColor = UIColor.red.withAlphaComponent(0.4).cgColor
        self.view.layer.insertSublayer(middlePulse, below: self.view.layer)
    }
    
    @IBAction func stopBtnTapped(_ sender: UIButton) {
        //self.dotView.layer.sublayers?.forEach { $0.removeAllAnimations() }
        
        self.dotView.layer.areAnimationsEnabled = false
    }    
}

