//
//  BirthdayViewController.swift
//  UseScrollView
//
//  Created by Alice Krutienko on 02.02.2021.
//

import Foundation
import UIKit

class BirthdayViewController : UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        let secondPage = GradientView()
        secondPage.startColor = UIColor(red: 0.5, green: 0.81, blue: 1, alpha: 1)
        secondPage.endColor = UIColor(red: 0.74, green: 0.95, blue: 1, alpha: 1)
        secondPage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(secondPage)
        
        let image = UIImage(named: "birthday-cake")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)

        let confetti = ConfettiView()
        confetti.confettiImage = UIImage(named: "confetti")
        confetti.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(confetti)
        
        let textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.font = UIFont(name: "Regular", size: 25)
        textLabel.text = "Happy Birthday!"
        textLabel.textAlignment = .center
        textLabel.textColor = .blue
        view.addSubview(textLabel)
        
        NSLayoutConstraint.activate([
            secondPage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            secondPage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            secondPage.topAnchor.constraint(equalTo: view.topAnchor),
            secondPage.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
        
        NSLayoutConstraint.activate([
            confetti.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            confetti.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            confetti.topAnchor.constraint(equalTo: view.topAnchor),
            confetti.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant:200),
            imageView.widthAnchor.constraint(equalToConstant:200),
            imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant:-20)])
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ])
    }
}
