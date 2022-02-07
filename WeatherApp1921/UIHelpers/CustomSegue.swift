//
//  CustomSegue.swift
//  WeatherApp1921
//
//  Created by Юрий Султанов on 24.01.2022.
//

import UIKit

final class CustomSegue: UIStoryboardSegue {
    private let animationTime = 1.5
    
    override func perform() {
        guard let containerView = source.view else { return }
        
        containerView.addSubview(destination.view)
        
        destination.view.frame = containerView.frame
        destination.view.transform = CGAffineTransform(
            translationX: source.view.bounds.width,
            y: -source.view.bounds.height)
        
        UIView.animate(withDuration: animationTime) {
            self.destination.view.transform = .identity
        } completion: { _ in
            self.source.present(
                self.destination,
                animated: false)
        }
    }
}
