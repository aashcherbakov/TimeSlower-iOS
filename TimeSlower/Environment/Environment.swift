//
//  Environment.swift
//  TimeSlower
//
//  Created by Alex Shcherbakov on 3/9/17.
//  Copyright © 2017 Alex Shcherbakov. All rights reserved.
//

import UIKit

internal protocol Environment {

    var router: Router { get }

    func run(in window: UIWindow?)
    
}

internal final class AppEnvironment: Environment {

    let router: Router = AppRouter()
    let builder: ViewControllerBuilder = AppViewControllerBuilder()

    private var window: UIWindow?

    func run(in window: UIWindow?) {
        self.window = window
        router.start(in: window, builder: builder)
    }
}



