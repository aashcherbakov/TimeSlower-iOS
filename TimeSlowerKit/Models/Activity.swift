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

public struct Routine {


}
