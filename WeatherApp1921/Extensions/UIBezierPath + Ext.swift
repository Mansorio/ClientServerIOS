//
//  UIBezierPath + Ext.swift
//  WeatherApp1921
//
//  Created by Юрий Султанов on 23.12.2021.
//

import UIKit

extension UIBezierPath {
    static func gift() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 47, y: 20.7))
        path.addLine(to: CGPoint(x: 43.6, y: 20.7))
        path.addCurve(to: CGPoint(x: 44.5, y: 13.8), controlPoint1: CGPoint(x: 45.5, y: 19), controlPoint2: CGPoint(x: 45.9, y: 16.1))
        path.addCurve(to: CGPoint(x: 39.8, y: 11.3), controlPoint1: CGPoint(x: 43.5, y: 12.2), controlPoint2: CGPoint(x: 41.7, y: 11.3))
        path.addCurve(to: CGPoint(x: 36.9, y: 12.1), controlPoint1: CGPoint(x: 38.8, y: 11.3), controlPoint2: CGPoint(x: 37.8, y: 11.6))
        path.addCurve(to: CGPoint(x: 32, y: 20.1), controlPoint1: CGPoint(x: 34.9, y: 13.3), controlPoint2: CGPoint(x: 32.9, y: 18))
        path.addCurve(to: CGPoint(x: 27.1, y: 12.1), controlPoint1: CGPoint(x: 31.1, y: 18), controlPoint2: CGPoint(x: 29.1, y: 13.3))
        path.addCurve(to: CGPoint(x: 24.2, y: 11.3), controlPoint1: CGPoint(x: 26.2, y: 11.6), controlPoint2: CGPoint(x: 25.2, y: 11.3))
        path.addCurve(to: CGPoint(x: 19.5, y: 13.8), controlPoint1: CGPoint(x: 22.3, y: 11.3), controlPoint2: CGPoint(x: 20.5, y: 12.2))
        path.addCurve(to: CGPoint(x: 20.4, y: 20.7), controlPoint1: CGPoint(x: 18.1, y: 16.1), controlPoint2: CGPoint(x: 18.5, y: 19))
        path.addLine(to: CGPoint(x: 17, y: 20.7))
        path.addCurve(to: CGPoint(x: 16, y: 21.7), controlPoint1: CGPoint(x: 16.4, y: 20.7), controlPoint2: CGPoint(x: 16, y: 21.2))
        path.addLine(to: CGPoint(x: 16, y: 30.2))
        path.addCurve(to: CGPoint(x: 17, y: 31.2), controlPoint1: CGPoint(x: 16, y: 30.8), controlPoint2: CGPoint(x: 16.4, y: 31.2))
        path.addLine(to: CGPoint(x: 17.6, y: 31.2))
        path.addLine(to: CGPoint(x: 17.6, y: 49.4))
        path.addCurve(to: CGPoint(x: 18.6, y: 50.4), controlPoint1: CGPoint(x: 17.6, y: 49.9), controlPoint2: CGPoint(x: 18, y: 50.4))
        path.addLine(to: CGPoint(x: 28.3, y: 50.4))
        path.addLine(to: CGPoint(x: 35.7, y: 50.4))
        path.addLine(to: CGPoint(x: 45.4, y: 50.4))
        path.addCurve(to: CGPoint(x: 46.4, y: 49.4), controlPoint1: CGPoint(x: 46, y: 50.4), controlPoint2: CGPoint(x: 46.4, y: 49.9))
        path.addLine(to: CGPoint(x: 46.4, y: 31.2))
        path.addLine(to: CGPoint(x: 47, y: 31.2))
        path.addCurve(to: CGPoint(x: 48, y: 30.2), controlPoint1: CGPoint(x: 47.6, y: 31.2), controlPoint2: CGPoint(x: 48, y: 30.8))
        path.addLine(to: CGPoint(x: 48, y: 21.7))
        path.addCurve(to: CGPoint(x: 47, y: 20.7), controlPoint1: CGPoint(x: 48, y: 21.2), controlPoint2: CGPoint(x: 47.6, y: 20.7))
        path.close()
        return path
        
    }
}
