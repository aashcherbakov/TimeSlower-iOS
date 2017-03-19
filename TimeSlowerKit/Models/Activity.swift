//
//  Activity.swift
//  TimeSlower
//
//  Created by Alex Shcherbakov on 3/11/17.
//  Copyright © 2017 Alex Shcherbakov. All rights reserved.
//

import Foundation

public protocol Activity {

    var resourceId: String { get }
    var name: String { get }
    var notifications: Bool { get }
    var timing: Timing { get }
    var stats: Stats { get }
    var estimates: Estimates { get }
    var days: [Weekday] { get }
    var results: Set<Result> { get }

}

public struct Routine: Activity {
    public var resourceId: String
    public var name: String
    public var notifications: Bool
    public var timing: Timing
    public var stats: Stats
    public var estimates: Estimates
    public var days: [Weekday]
    public var results: Set<Result>


    public init(name: String, days: [Weekday], timing: Timing, notifications: Bool = false) {
        self.name = name
        self.days = days
        self.timing = timing
        self.notifications = notifications

        resourceId = UUID().uuidString
        estimates = Estimates()
        results = []
        stats = Stats()
    }
}
