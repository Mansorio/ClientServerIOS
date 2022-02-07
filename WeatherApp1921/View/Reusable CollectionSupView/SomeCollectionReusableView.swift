//
//  SomeCollectionReusableView.swift
//  WeatherApp1921
//
//  Created by Юрий Султанов on 13.01.2022.
//

import UIKit

final class SomeCollectionReusableView: UICollectionReusableView {
    @IBOutlet var someHeaderLabel: UILabel?
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func cofigure(_ text: String) {
        someHeaderLabel?.text = text
    }
    
}
