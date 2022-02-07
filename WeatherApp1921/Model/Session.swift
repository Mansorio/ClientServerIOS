//
//  Session.swift
//  WeatherApp1921
//
//  Created by Anton Kuzmin on 07.02.2022.
//

final class someSession{
    var token: String = "";
    var userID: Int = 0;
    
    static let instance = someSession()
    
    private init(){ }
}
