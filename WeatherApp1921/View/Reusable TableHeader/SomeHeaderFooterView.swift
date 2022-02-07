//
//  SomeHeaderFooterView.swift
//  WeatherApp1921
//
//  Created by Юрий Султанов on 13.01.2022.
//

import UIKit

class SomeHeaderFooterView: UITableViewHeaderFooterView {
    override func prepareForReuse() {
        super.prepareForReuse()
        textLabel?.text = "Some title text"
        detailTextLabel?.text = "Some detail text label"
    }
}
