//
//  Observer.swift
//  WeatherApp1921
//
//  Created by Юрий Султанов on 07.02.2022.
//

final class SomeObserver {
    var subscribers = [AnySubscriber]()
    
    func subscribe(subscriber: SomeSubscriber) {
        let weakSubscriber = AnySubscriber(someSobscriber: subscriber)
        subscribers.append(weakSubscriber)
    }
    
    func notify() {
        subscribers.forEach {
            $0.someSobscriber?.anyNotifyFunc()
        }
    }
}

struct AnySubscriber {
    weak var someSobscriber: SomeSubscriber?
}


final class SomeSubscriber {
    func anyNotifyFunc() {
        
    }
}


