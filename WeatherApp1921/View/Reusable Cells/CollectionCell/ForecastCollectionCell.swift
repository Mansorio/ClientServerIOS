//
//  ForecastCollectionCell.swift
//  WeatherApp1921
//
//  Created by Юрий Султанов on 20.12.2021.
//

import UIKit

final class ForecastCollectionCell: UICollectionViewCell {
    @IBOutlet var forecastLabel: UILabel!
    @IBOutlet var forecastEmblem: UIImageView!
    @IBOutlet var forecastDate: UILabel!
    @IBOutlet var containerView: UIView!
    
    private var onAction: (() -> Void)?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.layer.cornerRadius = containerView.frame.height / 2
        containerView.layer.masksToBounds = true
    }
    
    func someFunc() {
        onAction?()
    }
    
    func configure(
        forecast: String,
        emblem: UIImage?,
        date: String,
        onAction: @escaping () -> Void) {
            self.forecastDate.text = date
            self.forecastEmblem.image = emblem
            self.forecastLabel.text = forecast
            self.containerView.backgroundColor = .systemTeal
            self.onAction = onAction
        }
}
