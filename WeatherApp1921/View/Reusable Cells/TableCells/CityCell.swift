//
//  CityCell.swift
//  WeatherApp1921
//
//  Created by Юрий Султанов on 20.12.2021.
//

import UIKit

protocol AnyCityCellDelegate: AnyObject {
    func didTapLike(city: String)
}

final class CityCell: UITableViewCell {
    
    weak var anyCellDelegate: AnyCityCellDelegate?
    var someClosure: (() -> Void)?
    
    @IBOutlet var cityEmblem: AvatarImage!
    @IBOutlet var cityName: UILabel!
    @IBOutlet var likeCounter: UIButton!
    @IBAction func didTap(_ sender: Any) {
//        anyCellDelegate?.didTapLike(city: cityName.text ?? "")
        someClosure?()
    }
    
    
    
    func configure(
        emblem: UIImage,
        name: String,
        likeCount: UInt) {
            self.cityEmblem.image = emblem
            self.cityName.text = name
            self.likeCounter.setTitle("\(likeCount)", for: .normal)
        }
    
}
