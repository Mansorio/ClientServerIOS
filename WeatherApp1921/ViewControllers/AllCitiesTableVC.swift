//
//  AllCitiesTableVC.swift
//  WeatherApp1921
//
//  Created by Юрий Султанов on 16.12.2021.
//

import UIKit

final class AllCitiesTableVC: UITableViewController {

    var cities = [
        CityModel(cityName: "Moscow", cityEmblem: UIImage(named: "New York") ?? UIImage(), likeCount: 1),
        CityModel(cityName: "New York", cityEmblem: UIImage(named: "New York") ?? UIImage(), likeCount: 1),
        CityModel(cityName: "Tokyo", cityEmblem: UIImage(named: "New York") ?? UIImage(), likeCount: 1),
        CityModel(cityName: "Los Angeles", cityEmblem: UIImage(named: "New York") ?? UIImage(), likeCount: 1),
        CityModel(cityName: "Shanghai", cityEmblem: UIImage(named: "New York") ?? UIImage(), likeCount: 1),
    ]

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(
            nibName: "CityCell",
            bundle: nil),
                           forCellReuseIdentifier: "cityCell")
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath) as? CityCell
        else { return UITableViewCell() }
        
        let currentCity = cities[indexPath.row]

        cell.configure(
            emblem: currentCity.cityEmblem,
            name: currentCity.cityName,
            likeCount: currentCity.likeCount)

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer { tableView.deselectRow(
            at: indexPath,
            animated: true) }
        performSegue(
            withIdentifier: "addCity",
            sender: nil)
    }

}

extension AllCitiesTableVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
}
