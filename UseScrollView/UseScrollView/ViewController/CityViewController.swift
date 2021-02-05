//
//  CityViewController.swift
//  UseScrollView
//
//  Created by Alice Krutienko on 02.02.2021.
//

import Foundation
import UIKit

class CityViewController : UIViewController {
    
    let fireworks = CityView()
    
    override func loadView() {
        let view = UIView()
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let thirdPage = GradientView()
        thirdPage.startColor = UIColor(red: 0.02, green: 0, blue: 0.12, alpha: 1)
        thirdPage.endColor = UIColor(red: 0.06, green: 0.04, blue: 0.69, alpha: 1)
        thirdPage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(thirdPage)
        
        let image = UIImage(named: "seattle")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        view.addSubview(imageView)
        
        fireworks.starImage = UIImage(named: "star")
        fireworks.tsparkImage = UIImage(named: "tspark")
        fireworks.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(fireworks)
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant:300),
            imageView.leadingAnchor.constraint(equalTo:view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo:view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            thirdPage.topAnchor.constraint(equalTo: view.topAnchor),
            thirdPage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            thirdPage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            thirdPage.bottomAnchor.constraint(equalTo: imageView.topAnchor)
        ])
     
        NSLayoutConstraint.activate([
            fireworks.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            fireworks.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            fireworks.topAnchor.constraint(equalTo: view.topAnchor),
            fireworks.bottomAnchor.constraint(equalTo: imageView.centerYAnchor)
        ])
    }
}
