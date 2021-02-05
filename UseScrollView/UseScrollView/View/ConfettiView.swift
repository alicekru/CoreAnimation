//
//  ConfettiView.swift
//  UseScrollView
//
//  Created by Alice Krutienko on 01.02.2021.
//

import UIKit

class ConfettiView: UIView {
    
    var confettiImage: UIImage?

    override class var layerClass: AnyClass {
        return CAEmitterLayer.self
    }
    
    override func layoutSubviews() {
        
        let emitter = self.layer as! CAEmitterLayer

        emitter.emitterShape = .line
        emitter.emitterPosition = CGPoint(x: bounds.midX, y: 0)
        emitter.emitterSize = CGSize(width: bounds.size.width, height: 1)

        let red = makeEmitterCell(color: UIColor(red: 1, green: 0, blue: 0, alpha: 1))
        let green = makeEmitterCell(color: UIColor(red: 0, green: 1, blue: 0, alpha: 1))
        let blue = makeEmitterCell(color: UIColor(red: 0, green: 0, blue: 1, alpha: 1))

        emitter.emitterCells = [red, green, blue]
    }
    
    func makeEmitterCell(color: UIColor) -> CAEmitterCell {
        let cell = CAEmitterCell()
        cell.birthRate = 4
        cell.lifetime = 15.0
        cell.spin = -0.5
        cell.spinRange = 1.0
        cell.lifetimeRange = 0
        cell.color = color.cgColor
        cell.velocity = 60
        cell.velocityRange = 40
        cell.emissionLongitude = .pi
        cell.emissionRange = .pi / 8
        cell.scale = 0.25
        cell.scaleRange = 0.6
        cell.contents = confettiImage?.cgImage
        return cell
    }
}
