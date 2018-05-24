//
//  Notification.NameExtension.swift
//  TimerDemo
//
//  Created by Vitaliy Delidov on 5/24/18.
//  Copyright © 2018 Vitaliy Delidov. All rights reserved.
//

import Foundation

extension Notification.Name {
    static let playButtonStateDidChangeNotification  = Notification.Name("playButtonStateDidChangeNotification")
    static let stopButtonStateDidChangeNotification  = Notification.Name("stopButtonStateDidChangeNotification")
    static let playheadPositionDidChangeNotification = Notification.Name("playheadPositionDidChangeNotification")
}


// MARK: - NotificationCenter

extension NotificationCenter {
    static func post(_ name: Notification.Name, object: Any?) {
        NotificationCenter.default.post(name: name, object: object)
    }
    static func addObserver(_ observer: Any, selector: Selector, name: NSNotification.Name, object: Any?) {
        NotificationCenter.default.addObserver(observer, selector: selector, name: name, object: object)
    }
    static func removeObserver(_ observer: Any, name: Notification.Name?, object: Any?) {
        NotificationCenter.default.removeObserver(observer, name: name, object: object)
    }
    static func removeObserver(_ observer: Any) {
        NotificationCenter.default.removeObserver(observer)
    }
}
