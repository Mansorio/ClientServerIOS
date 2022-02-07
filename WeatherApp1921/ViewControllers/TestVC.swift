//
//  TestVC.swift
//  WeatherApp1921
//
//  Created by Юрий Султанов on 23.12.2021.
//

import UIKit

final class TestVC: UIViewController {
    @IBOutlet var someImageView: UIImageView!
    @IBOutlet var leftConstraint: NSLayoutConstraint!
//    @IBOutlet var someContraintCollection: [NSLayoutConstraint]!
    
    
    private var propertyAnimator: UIViewPropertyAnimator!
    
    private var isAnimated = false
    
    @IBAction func didTapAnimate(_ sender: Any) {
        animate11()
    }
    
    private let duration = 2.0
    private let delay = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        someImageView.isUserInteractionEnabled = true
        someImageView.addGestureRecognizer(UIPanGestureRecognizer(
            target: self,
            action: #selector(didPan(_:))))
    }
    
    @objc
    private func didPan(_ gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .began:
            propertyAnimator = UIViewPropertyAnimator(
                duration: duration,
                curve: .easeInOut,
                animations: {
                    let transform = CGAffineTransform(rotationAngle: .pi / 2)
                    self.someImageView.transform = transform
                })
            
            propertyAnimator.pauseAnimation()
        case .changed:
            let translation = gesture.translation(in: self.someImageView)
            print(translation.y)
            propertyAnimator.fractionComplete = -translation.y / 100
        case .ended:
            if propertyAnimator.fractionComplete > 0.5 {
                propertyAnimator.continueAnimation(
                    withTimingParameters: nil,
                    durationFactor: 0)
            } else {
                propertyAnimator.stopAnimation(true)
                propertyAnimator.finishAnimation(at: .current)
            }
            
        default:
            return
        }
    }
    
    func animate0() {
        view.layoutIfNeeded()
        UIView.animate(
            withDuration: duration,
            delay: delay,
            options: [
                .curveEaseInOut,
                .repeat,
                .autoreverse,
            ]) {
                self.leftConstraint.isActive = false
                self.someImageView.alpha = 0.0
                self.view.layoutIfNeeded()
            } completion: { isCompleted in
                self.leftConstraint.isActive = true
                self.someImageView.alpha = 1.0
                self.view.layoutIfNeeded()
            }
    }
    
    func animate1() {
        view.layoutIfNeeded()
        
        UIView.animate(
            withDuration: duration,
            delay: delay,
            options: [
                .curveLinear,
            ]) {
                self.someImageView.center.x += 100
                self.view.layoutIfNeeded()
//                self.imageView.transform = CGAffineTransform(translationX: 100.0, y: 50.0)
            }
    }
    
    func animate2() {
//        UIView.animate(withDuration: duration) {
//            self.someImageView.frame.origin.y += 150
//        }
        
        UIView.animate(withDuration: 1.0, delay: 0.0, animations: {
            self.someImageView.frame.origin.x -= 100
        })
        UIView.animate(withDuration: 1.0, delay: 1.0, animations: {
            self.someImageView.frame.origin.x += 100
        })
    }
    
    func animate3() {
        UIView.transition(
            with: someImageView,
            duration: duration,
            options: [
                .autoreverse,
                .transitionFlipFromBottom,
            ]) {
                self.someImageView.image = UIImage(named: "Tokyo")
            } completion: { isCompletion in
                UIView.transition(
                    with: self.someImageView,
                    duration: 0.0,
                    options: .curveLinear) {
                        self.someImageView.image = UIImage(named: "New York")
                    }
            }
    }
    
    func animate4() {
//        CATransaction.begin()
//        CATransaction.setCompletionBlock {
//            self.someImageView.frame.origin.x += 150
//        }
        
        let animation = CABasicAnimation(keyPath: "position.x")
        animation.beginTime = CACurrentMediaTime() + 0.5
        animation.fromValue = someImageView.layer.position.x
        animation.toValue = someImageView.layer.position.x + 150
        animation.duration = duration
//        animation.fillMode = .backwards
        
        someImageView.layer.add(
            animation,
            forKey: nil)
//        CATransaction.commit()
    }
    
    func animate5() {
        UIView.animate(
            withDuration: duration,
            delay: 0.0,
            usingSpringWithDamping: 0.1,
            initialSpringVelocity: 1.0) {
                self.someImageView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            } completion: { _ in
                self.someImageView.transform = .identity
            }

    }
    
    func animate6() {
        let animation = CASpringAnimation(keyPath: "position.y")
        animation.fromValue = someImageView.layer.position.y
        animation.toValue = someImageView.layer.position.y + 200
        animation.mass = 2
        animation.stiffness = 100
        animation.initialVelocity = 0.5
        animation.duration = 10.0
        
        someImageView.layer.add(animation, forKey: nil)
    }
    
    func animate7() {
        UIView.animateKeyframes(
            withDuration: duration,
            delay: 0.0,
            options: [
                .autoreverse,
                .repeat,
                .calculationModeDiscrete,
            ]) {
                UIView.addKeyframe(
                    withRelativeStartTime: 0.0,
                    relativeDuration: 0.25) {
                        self.someImageView.center.x += 100
                    }
                
                UIView.addKeyframe(
                    withRelativeStartTime: 0.15,
                    relativeDuration: 0.50) {
                        self.someImageView.center.y += 150
                    }
                UIView.addKeyframe(
                    withRelativeStartTime: 0.5,
                    relativeDuration: 0.5) {
                        self.someImageView.alpha = 0.0
                    }
                
            } completion: { isCompleted in
                print(isCompleted)
            }
    }
    
    func animate8() {
        let animationGroup = CAAnimationGroup()
        animationGroup.duration = duration
        animationGroup.repeatCount = 1
        animationGroup.autoreverses = false
        animationGroup.timingFunction = CAMediaTimingFunction(controlPoints: 0.35, 0.82, 0.8, 0.38)
        
        let positionX = CABasicAnimation(keyPath: "position.x")
        positionX.fromValue = someImageView.center.x
        positionX.toValue = someImageView.center.x + 150
        positionX.fillMode = .both
        positionX.isRemovedOnCompletion = false
        
        let positionY = CABasicAnimation(keyPath: "position.y")
        positionY.fromValue = someImageView.center.y
        positionY.toValue = someImageView.center.y + 150
        positionY.fillMode = .both
        positionY.isRemovedOnCompletion = false
        
        let opacityAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        opacityAnimation.fromValue = 1
        opacityAnimation.toValue = 0.5
        opacityAnimation.fillMode = .both
        opacityAnimation.isRemovedOnCompletion = true
        
        animationGroup.animations = [
            positionX,
            positionY,
            opacityAnimation,
        ]
        
        someImageView.layer.add(
            animationGroup,
            forKey: nil)
    }
    
    
    func animate9() {
        let someLayer = CAShapeLayer()
        someLayer.path = UIBezierPath.gift().cgPath
        someLayer.lineWidth = 2.0
        someLayer.strokeColor = UIColor.red.cgColor
        someLayer.fillColor = UIColor.clear.cgColor
        someLayer.strokeStart = 0.0
        someLayer.strokeEnd = 0.0
        
        someImageView.layer.addSublayer(someLayer)
        
        let strokeEndAnimation = CABasicAnimation(keyPath: #keyPath(CAShapeLayer.strokeEnd))
        strokeEndAnimation.fromValue = 0.0
        strokeEndAnimation.toValue = 1.0
        
        let strokeStartAnimation = CABasicAnimation(keyPath: #keyPath(CAShapeLayer.strokeStart))
        strokeStartAnimation.fromValue = -0.1
        strokeStartAnimation.toValue = 0.9
        
        let animationGroup = CAAnimationGroup()
        animationGroup.duration = duration
        animationGroup.repeatCount = 3
        animationGroup.animations = [
            strokeStartAnimation,
            strokeEndAnimation,
        ]
        
        someLayer.add(
            animationGroup,
            forKey: nil)
    }
    
    func animate10() {
        let circleLayer = CAShapeLayer()
        circleLayer.backgroundColor = UIColor.systemTeal.cgColor
        circleLayer.frame = CGRect(x: 150.0, y: 150.0, width: 7.0, height: 7.0)
        circleLayer.cornerRadius = 3.5
        
        someImageView.layer.addSublayer(circleLayer)
        
        let someAnimation = CAKeyframeAnimation(keyPath: #keyPath(CAShapeLayer.position))
        someAnimation.path = UIBezierPath.gift().cgPath
        someAnimation.calculationMode = .paced
        someAnimation.duration = duration
        someAnimation.repeatCount = 3
        
        circleLayer.add(
            someAnimation,
            forKey: nil)
    }
    
    func animate11() {
        let rotation = CATransform3DMakeRotation(.pi, 0.0, 0.5, 0.0)
        
        let someAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.transform))
        someAnimation.duration = duration
        someAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        someAnimation.fromValue = someImageView.layer.transform
        someAnimation.toValue = rotation
        
        someImageView.setAnchorPoint(CGPoint(x: 0.0, y: 0.5))
        someImageView.layer.add(
            someAnimation,
            forKey: nil)
    }
}

//extension TestVC: UIGestureRecognizerDelegate {
//    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
//        true
//    }
//}
