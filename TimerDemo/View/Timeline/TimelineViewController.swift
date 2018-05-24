//
//  TimelineViewController.swift
//  TimerDemo
//
//  Created by Vitaliy Delidov on 5/24/18.
//  Copyright © 2018 Vitaliy Delidov. All rights reserved.
//

import Cocoa

class TimelineViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
}


// MARK: - Private

private extension TimelineViewController {
    
    func setup() {
        registeredNotification()
    }
    
    func registeredNotification() {
        NotificationCenter.addObserver(self,
                                       selector: #selector(playButtonStateDidChange),
                                       name: .playButtonStateDidChangeNotification,
                                       object: nil)
        
        NotificationCenter.addObserver(self,
                                       selector: #selector(stopButtonStateDidChange),
                                       name: .stopButtonStateDidChangeNotification,
                                       object: nil)
    }
    
}


// MARK: - Notification

@objc
extension TimelineViewController {
    
    func playButtonStateDidChange(_ notification: Notification) {
        guard let _ = notification.object as? NSButton else { return }
        
    }
    
    func stopButtonStateDidChange(_ notification: Notification) {
        guard let _ = notification.object as? NSButton else { return }
        
    }
    
}
