//
//  MyCitiesTableVC.swift
//  WeatherApp1921
//
//  Created by Юрий Султанов on 16.12.2021.
//

import UIKit

final class MyCitiesTableVC: UITableViewController {
    var cities = [CityModel]() {
        didSet {
            //sortCities(cities: cities)
        }
    }
    
    var sortedCities = [String]()
    
    @IBAction func addCity(segue: UIStoryboardSegue) {
        guard
            segue.identifier == "addCity",
            let allCitiesController = segue.source as? AllCitiesTableVC,
            let cityIndexPath = allCitiesController.tableView.indexPathForSelectedRow,
            !self.cities.contains(allCitiesController.cities[cityIndexPath.row])
        else { return }
        self.cities.append(allCitiesController.cities[cityIndexPath.row])
        tableView.reloadData()
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(
            UINib(
                nibName: "CityCell",
                bundle: nil),
            forCellReuseIdentifier: "cityCell")
        tableView.register(
            SomeHeaderFooterView.self,
            forHeaderFooterViewReuseIdentifier: "someHeaderFooterView")
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
        cell.anyCellDelegate = self
        cell.someClosure = {
            print("CLOSURE💯")
        }
        cell.configure(
            emblem: currentCity.cityEmblem,
            name: currentCity.cityName,
            likeCount: currentCity.likeCount)

        return cell
    }
    
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        guard
//            let someView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "someHeaderFooterView") as? SomeHeaderFooterView
//        else { return UIView() }
//        
//        return someView
//    }
    
//    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        <#code#>
//    }
    
    
//    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        <#code#>
//    }

    override func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            cities.remove(at: indexPath.row)
            tableView.deleteRows(
                at: [indexPath],
                with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer { tableView.deselectRow(
            at: indexPath,
            animated: true)}
        performSegue(
            withIdentifier: "showForecast",
            sender: nil)
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        ["A","B","C"]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "loginScreen":
            let someNotification = Notification.Name("myNewNotification")
            NotificationCenter.default.post(
                name: someNotification,
                object: nil,
                userInfo: ["someModel": CityModel(cityName: "someCity", cityEmblem: UIImage(), likeCount: 3)])
        default:
            break
        }
    }
}

extension MyCitiesTableVC: AnyCityCellDelegate {
    func didTapLike(city: String) {
        guard
            var city = cities.first(where: { $0.cityName == city }),
            let index = cities.firstIndex(of: city)
        else { return }
        cities[index].likeCount += 1
        tableView.reloadRows(
            at: [
                IndexPath(row: index, section: 0),
            ],
            with: .automatic)
    }
}
