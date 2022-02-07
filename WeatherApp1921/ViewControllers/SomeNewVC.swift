//
//  SomeNewVC.swift
//  WeatherApp1921
//
//  Created by Юрий Султанов on 27.01.2022.
//

import UIKit

final class SomeNewVC: UIViewController {
    private lazy var someTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello"
        label.textAlignment = .center
        label.textColor = .red
        label.font = UIFont.systemFont(
            ofSize: 21,
            weight: .semibold)
        
        return label
    }()
    
    private lazy var someTitle0: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "World"
        label.textAlignment = .center
        label.textColor = .green
        label.font = UIFont.systemFont(
            ofSize: 20,
            weight: .heavy)
        
        return label
    }()
    
    private lazy var someTable: UITableView = {
        let table = UITableView(
            frame: .zero,
            style: .insetGrouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .yellow
        table.separatorColor = .purple
        table.delegate = self
        table.dataSource = self
        
        return table
    }()
    
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        makeContraints()
    }
    
    // MARK: Pivate methods
    private func addSubviews() {
        view.addSubview(someTable)
        view.addSubview(someTitle)
        view.addSubview(someTitle0)
    }
    
    private func makeContraints() {
        NSLayoutConstraint.activate([
            someTable.topAnchor.constraint(equalTo: view.topAnchor),
            someTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            someTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            someTable.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            someTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            someTitle.centerYAnchor.constraint(
                equalTo: view.centerYAnchor,
                constant: 50),
            someTitle.widthAnchor.constraint(
                equalTo: view.widthAnchor,
                multiplier: 0.75),
            
            
            someTitle0.centerXAnchor.constraint(equalTo: someTitle.centerXAnchor),
            someTitle0.topAnchor.constraint(
                equalTo: someTitle.bottomAnchor,
                constant: 15.0),
            someTitle0.widthAnchor.constraint(equalTo: someTitle0.widthAnchor),
            
        ])
    }
}

extension SomeNewVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
    
}

extension SomeNewVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer { tableView.deselectRow(at: indexPath, animated: true) }
        print(indexPath)
    }
}
