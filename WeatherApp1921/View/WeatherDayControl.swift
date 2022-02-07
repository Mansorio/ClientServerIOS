//
//  WeatherDayControl.swift
//  WeatherApp1921
//
//  Created by Юрий Султанов on 10.01.2022.
//

import UIKit

enum Day: Int, CaseIterable {
    case monday, tuesday, wednesday, thersday, friday, saturday, sunday
    
    var title: String {
        switch self {
        case .monday:
            return "ПН"
        case .tuesday:
            return "ВТ"
        case .wednesday:
            return "СР"
        case .thersday:
            return "ЧТ"
        case .friday:
            return "ПТ"
        case .saturday:
            return "СБ"
        case .sunday:
            return "ВС"
        }
    }
}

@IBDesignable
final class WeatherDayControl: UIControl {
    // MARK: Public properties
    var selectedDay: Day? = nil {
        didSet {
            updateSelectedDay()
            sendActions(for: .valueChanged)
        }
    }
    
    // MARK: Private properties
    private var buttons = [UIButton]()
    private var stackView: UIStackView?
    
    // MARK: Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView?.frame = bounds
    }
    
    // MARK: Actions
    @objc
    private func selectDay(_ button: UIButton) {
        guard
            let index = buttons.firstIndex(of: button),
            let day = Day(rawValue: index)
        else { return }
        self.selectedDay = day
        
    }
    
    // MARK: Private methods
    private func setupView() {
        Day.allCases.forEach {
            let button = UIButton(type: .system)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle(
                $0.title,
                for: [])
            button.setTitleColor(
                .systemGray4,
                for: .normal)
            button.setTitleColor(
                .systemBackground,
                for: .selected)
            button.addTarget(
                self,
                action: #selector(selectDay(_:)),
                for: .touchUpInside)
            buttons.append(button)
        }
        
        stackView = UIStackView(arrangedSubviews: buttons)
        guard let stackView = stackView else { return }
        addSubview(stackView)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
    }
    
    private func updateSelectedDay() {
        for (index, button) in buttons.enumerated() {
            guard let day = Day(rawValue: index) else { continue }
            button.isSelected = day == selectedDay
        }
    }
    
}
