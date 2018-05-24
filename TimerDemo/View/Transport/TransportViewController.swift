//
//  TransportViewController.swift
//  TimerDemo
//
//  Created by Vitaliy Delidov on 5/24/18.
//  Copyright © 2018 Vitaliy Delidov. All rights reserved.
//

import Cocoa

enum DisplayMode {
    case timesecs
    case timecode
}

class TransportViewController: NSViewController {
    
    @IBOutlet weak var display: NSTextField!
    @IBOutlet weak var playButton: NSButton!
    @IBOutlet weak var stopButton: NSButton!
    
    private var displayMode: DisplayMode = .timecode {
        didSet { updateDisplay(for: elapsedTime) }
    }
    private var elapsedTime: TimeInterval = 0 {
        didSet { updateDisplay(for: elapsedTime) }
    }
    
    private var isPlaying = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    deinit {
        NotificationCenter.removeObserver(self)
    }
    
}


// MARK: - Private

private extension TransportViewController {
    
    func setup() {
        registeredNotification()
    }
    
    func registeredNotification() {
        NotificationCenter.addObserver(self,
                                       selector: #selector(playheadPositionDidChange),
                                       name: .playheadPositionDidChangeNotification,
                                       object: nil)
    }
    
    func updateDisplay(for time: TimeInterval) {
        display.stringValue = string(for: time)
    }
    
    func string(for time: TimeInterval) -> String {
        switch displayMode {
        case .timesecs: return "00:00:00.000"
        case .timecode: return "00:00:00:00"
        }
    }
    
}


// MARK: - Actions

extension TransportViewController {
    
    @IBAction func play(_ sender: NSButton) {
        sender.state = .on
        if !isPlaying {
            isPlaying = true
            NotificationCenter.post(.playButtonStateDidChangeNotification, object: sender)
        }
    }
    
    @IBAction func stop(_ sender: NSButton) {
        if isPlaying {
            isPlaying = false
            playButton.setNextState()
            NotificationCenter.post(.stopButtonStateDidChangeNotification, object: sender)
        }
    }
    
    @IBAction func mode(_ sender: NSPopUpButton) {
        guard let selectedItem = sender.selectedItem else { return }
        selectedItem.state = .on
        
        sender.menu?.items
            .filter { $0 != selectedItem }
            .forEach { $0.state = .off }
        
        switch selectedItem.title {
        case .timesecs: displayMode = .timesecs
        case .timecode: displayMode = .timecode
        default:
            break
        }
    }
    
}


// MARK: - Notification

@objc
extension TransportViewController {
    
    func playheadPositionDidChange(_ notification: Notification) {
        guard let current = notification.object as? TimeInterval else { return }
        
        elapsedTime = current
    }
    
}
