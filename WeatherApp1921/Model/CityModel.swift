//
//  CityModel.swift
//  WeatherApp1921
//
//  Created by Юрий Султанов on 21.12.2021.
//

import UIKit

struct CityModel {
    let cityName: String
    let cityEmblem: UIImage
    var likeCount: UInt
}

extension CityModel: Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.cityName == rhs.cityName
    }
}
