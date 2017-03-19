//
//  Resource.swift
//  TimeSlower
//
//  Created by Alex Shcherbakov on 3/11/17.
//  Copyright © 2017 Alex Shcherbakov. All rights reserved.
//

import Foundation

internal protocol Resource {

    func create<T: Persistable>(_ object: T, completion: (T) -> Void)
    func retrieve<T: Persistable>(_ key: String) -> T?

}


