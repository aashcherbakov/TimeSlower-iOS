//
//  Result.swift
//  TimeSlower
//
//  Created by Alex Shcherbakov on 3/11/17.
//  Copyright © 2017 Alex Shcherbakov. All rights reserved.
//

import Foundation

public struct Result {

    let resourceId: String

}

extension Result: Equatable {
    public static func ==(left: Result, right: Result) -> Bool {
        return left.resourceId == right.resourceId
    }
}

extension Result: Hashable {
    public var hashValue: Int {
        return resourceId.hashValue
    }
}
