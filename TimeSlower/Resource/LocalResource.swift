//
//  LocalResource.swift
//  TimeSlower
//
//  Created by Alex Shcherbakov on 3/17/17.
//  Copyright © 2017 Alex Shcherbakov. All rights reserved.
//

import Foundation

internal struct LocalResource: Resource {

    internal func create<T : Persistable>(_ object: T, completion: (T) -> Void) {
        return completion("" as! T)
    }

    func retrieve<T : Persistable>(_ key: String) -> T? {
        return nil
    }

}
