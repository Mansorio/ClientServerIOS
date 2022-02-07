//
//  Singleton.swift
//  WeatherApp1921
//
//  Created by Юрий Султанов on 07.02.2022.
//

final class SomeSingleton {
    var token: String = ""
    var userID: Int = 0
    
    static let instance = SomeSingleton()
    
    private init() { }
}
