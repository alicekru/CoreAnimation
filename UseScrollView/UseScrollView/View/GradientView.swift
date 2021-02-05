//
//  GradientView.swift
//  UseScrollView
//
//  Created by Alice Krutienko on 01.02.2021.
//

import UIKit

class GradientView: UIView {

    var startColor: UIColor = UIColor.white
    var endColor: UIColor = UIColor.white
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    override func layoutSubviews() {
        (layer as! CAGradientLayer).colors = [startColor.cgColor, endColor.cgColor]
    }
}
