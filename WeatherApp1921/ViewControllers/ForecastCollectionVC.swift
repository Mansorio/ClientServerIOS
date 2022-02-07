//
//  ForecastCollectionVC.swift
//  WeatherApp1921
//
//  Created by Юрий Султанов on 16.12.2021.
//

import UIKit

class ForecastCollectionVC: UIViewController {
    
    @IBOutlet var dayControl: WeatherDayControl!
    @IBOutlet var weatherCollection: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.weatherCollection.register(
            UINib(
                nibName: "ForecastCollectionCell",
                bundle: nil),
            forCellWithReuseIdentifier: "forecastCollectionCell")
        
        dayControl.addTarget(
            self,
            action: #selector(dayChanged),
            for: .valueChanged)
    }
    
    @objc
    private func dayChanged() {
        print(dayControl.selectedDay)
    }
}

extension ForecastCollectionVC: UICollectionViewDataSource, UICollectionViewDelegate {
    // MARK: UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "forecastCollectionCell",
            for: indexPath)
                as? ForecastCollectionCell
        else { return UICollectionViewCell() }
        cell.configure(
            forecast: "+15",
            emblem: UIImage(systemName: "sun.haze"),
            date: "20.12.2021",
            onAction:  { print("someAction") })
    
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        switch kind {
//        case UICollectionView.elementKindSectionHeader:
//            guard let someHeader = collectionView
//                .dequeueReusableSupplementaryView(
//                    ofKind: kind,
//                    withReuseIdentifier: "someCollectionReusableView",
//                    for: indexPath)
//            as? SomeCollectionReusableView
//            else { return UICollectionReusableView() }
//            someHeader.cofigure("\(kind) \(indexPath.section)")
//            return someHeader
//            //some config
////        case UICollectionView.elementKindSectionFooter:
////            //some
//        default:
//            return UICollectionReusableView()
//        }
//    }
}
