//
//  CityView.swift
//  UseScrollView
//
//  Created by Alice Krutienko on 01.02.2021.
//

import UIKit

class CityView: UIView {
    
    var starImage:UIImage?
    var tsparkImage:UIImage?
        
    override class var layerClass:AnyClass {
        return CAEmitterLayer.self
    }
    
    override func layoutSubviews() {
        let emitter = self.layer as! CAEmitterLayer
        emitter.emitterPosition = CGPoint(x: bounds.midX, y: bounds.maxY)
        emitter.emitterSize = CGSize(width: bounds.size.width * 0.50, height: 1.0)
        emitter.renderMode = .additive
        let rocket = makeEmiterCellRocket()
        let flare = makeEmiterCellFlare()
        let firework = makeEmiterCellFirework()
        let sparkle = makeSparkle()
        let prespark = makeEmitterCellPrespark(firework:firework)
        prespark.emitterCells = [sparkle]
        rocket.emitterCells = [flare, firework, prespark]
        emitter.emitterCells = [rocket]
    }
        
    func makeEmiterCellRocket() -> CAEmitterCell {
        let cell = CAEmitterCell()
        cell.emissionLongitude = -.pi/2
        cell.emissionLatitude = 0
        cell.emissionRange = .pi/4
        cell.lifetime = 1.5
        cell.birthRate = 2
        cell.velocity = 50
        cell.velocityRange = 10
        cell.yAcceleration = -150
        
        let color = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
        cell.color = color.cgColor
        cell.name = "rocket"
        return cell
    }
    
    func makeEmiterCellFlare() -> CAEmitterCell {
        let cell = CAEmitterCell()
        cell.color = UIColor.white.cgColor
        cell.contents = tsparkImage?.cgImage
        cell.emissionLongitude = (2 * .pi)
        cell.birthRate = 45
        cell.lifetime = 1.5
        cell.velocity = 100
        cell.scale = 0.3
        cell.yAcceleration = 350
        cell.emissionRange = .pi/7
        cell.alphaSpeed = -0.7
        cell.scaleSpeed = -0.1
        cell.scaleRange = 0.1
        cell.beginTime = 0.01
        cell.duration = 2.0
        cell.name = "flare"
        return cell
    }
    
    func makeEmiterCellFirework() -> CAEmitterCell {
        let cell = CAEmitterCell()
        cell.contents = starImage?.cgImage
        cell.birthRate = 8000
        cell.velocity = 130
        cell.lifetime = 1.0
        cell.emissionRange = (2 * .pi)
        cell.scale = 0.1
        cell.alphaSpeed = -0.2
        cell.yAcceleration = 80
        cell.beginTime = 1.5
        cell.duration = 0.1
        cell.scaleSpeed = -0.015
        cell.spin = 2
        cell.name = "firework"
        return cell
    }
    
    func makeEmitterCellPrespark(firework:CAEmitterCell) -> CAEmitterCell {
        let cell = CAEmitterCell()
        cell.birthRate = 80
        cell.velocity = firework.velocity * 0.70
        cell.lifetime = 1.2
        cell.yAcceleration = firework.yAcceleration * 0.85
        cell.beginTime = firework.beginTime - 0.2
        cell.emissionRange = firework.emissionRange
        cell.greenSpeed = 100
        cell.blueSpeed = 100
        cell.redSpeed = 100
        cell.name = "preSpark"
        return cell
    }
    
    func makeSparkle() -> CAEmitterCell {
        let cell = CAEmitterCell()
        cell.contents = starImage?.cgImage
        cell.birthRate = 10
        cell.lifetime = 0.05
        cell.yAcceleration = 150
        cell.beginTime = 0.8
        cell.scale = 0.05
        return cell
    }
}
