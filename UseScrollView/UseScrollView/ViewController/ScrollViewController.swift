//
//  ScrollViewController.swift
//  UseScrollView
//
//  Created by Alice Krutienko on 02.02.2021.
//

import Foundation
import UIKit

class ScrollViewController: UIViewController {

    let scrollView :UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isPagingEnabled = true
        return scrollView
    }()
    
    let content = [SnowViewController(), BirthdayViewController(), CityViewController()]
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func loadView() {
        view = UIView(frame: UIScreen.main.bounds)
        scrollView.frame = view.frame
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureChildren()
    }

    private func configureChildren() {
        for controller in content {
            add(child: controller, in: scrollView)
            controller.view.frame = view.frame
            controller.view.frame.origin.x = scrollView.contentSize.width
            scrollView.contentSize.width += view.frame.size.width
        }
    }
}


