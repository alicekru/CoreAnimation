//
//  Extension.swift
//  UseScrollView
//
//  Created by Alice Krutienko on 04.02.2021.
//

import Foundation
import UIKit

extension UIViewController {
    
    func add(child childViewController: UIViewController, in view: UIView) {
        beginAddChild(child: childViewController)
        view.addSubview(childViewController.view)
        endAddChild(child: childViewController)
    }
    
    private func beginAddChild(child childViewController:UIViewController){
        childViewController.beginAppearanceTransition(true, animated: false)
        self.addChild(childViewController)
    }
       
    private func endAddChild(child childViewController:UIViewController){
        childViewController.didMove(toParent: self)
        childViewController.endAppearanceTransition()
    }
}
