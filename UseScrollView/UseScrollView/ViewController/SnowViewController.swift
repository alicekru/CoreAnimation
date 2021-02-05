//
//  SnowViewController.swift
//  UseScrollView
//
//  Created by Alice Krutienko on 02.02.2021.
//

import Foundation
import UIKit

class SnowViewController : UIViewController {
    
    let snow = WinterView()
    let startButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        let firstPage = GradientView()
        firstPage.translatesAutoresizingMaskIntoConstraints = false
        firstPage.startColor = UIColor(red: 0.1, green: 0.25, blue: 0.5, alpha: 1)
        firstPage.endColor = UIColor(red: 0.75, green: 0.8, blue: 0.9, alpha: 1)
        firstPage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(firstPage)
        
        snow.translatesAutoresizingMaskIntoConstraints = false
        snow.isHidden = true
        snow.snowImage = UIImage(named: "snow")
        view.addSubview(snow)
        
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.backgroundColor = .white
        startButton.layer.cornerRadius = 10
        startButton.setTitle("Make it snow", for: .normal)
        startButton.setTitleColor(.blue, for: .normal)
        startButton.addTarget(self, action: #selector(makeItSnow(sender:)), for: .touchUpInside)
        view.addSubview(startButton)
        
        NSLayoutConstraint.activate([
            firstPage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            firstPage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            firstPage.topAnchor.constraint(equalTo: view.topAnchor),
            firstPage.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            snow.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            snow.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            snow.topAnchor.constraint(equalTo: view.topAnchor),
            snow.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            startButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            startButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            startButton.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    @objc private func makeItSnow(sender:UIButton) {
        snow.isHidden.toggle()
        toggleButtonState()
    }
    
    private func toggleButtonState() {
        if startButton.title(for: .normal) ==  "Make it snow"{
            startButton.setTitle("Make it stop", for: .normal)
            startButton.setTitleColor(.red, for: .normal)
        } else{
            startButton.setTitle("Make it snow", for: .normal)
            startButton.setTitleColor(.blue, for: .normal)
        }
    }
}
